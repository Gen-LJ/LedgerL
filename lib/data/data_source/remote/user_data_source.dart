import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/data/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

abstract class UserRemoteDataSource {
  Future<UserInfoModel> saveUser(UserInfoModel user);

  Future<List<UserInfoModel>> getAllUsers();

  Future<UserInfoModel> getUser(String email);
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore _firebaseFireStore;
  final Logger logger;

  UserRemoteDataSourceImpl(this._firebaseFireStore, this.logger);

  @override
  Future<UserInfoModel> saveUser(UserInfoModel user) async {
    try {
      DocumentSnapshot documentSnapshot = await _firebaseFireStore
          .collection(FirebaseConfig.usersCollectionKey)
          .doc(user.id)
          .get();

      if (documentSnapshot.exists) {
        debugPrint('User Data Exist');
        _firstTimeAddBalanceToUser(user);
        logger.i(user);
        return UserInfoModel.fromFireStore(documentSnapshot);
      } else {
        debugPrint('Creating User Data');
        CollectionReference refUser =
            _firebaseFireStore.collection(FirebaseConfig.usersCollectionKey);
        await refUser.doc(user.id).set(user.toJson());
        _firstTimeAddBalanceToUser(user);
        logger.i(user);
        return user;
      }
    } catch (e) {
      logger.e(e);
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<UserInfoModel>> getAllUsers() async {
    try {
      // Get the collection reference
      CollectionReference refUser =
          _firebaseFireStore.collection(FirebaseConfig.usersCollectionKey);

      // Fetch all documents in the collection
      QuerySnapshot querySnapshot = await refUser.get();

      // Convert the QuerySnapshot into a list of UserInfoModel
      List<UserInfoModel> users = querySnapshot.docs.map((doc) {
        return UserInfoModel.fromFireStore(
            doc); // Assuming fromFireStore method exists
      }).toList();

      // Log the result for debugging
      logger.i(users);
      return users;
    } catch (e) {
      logger.e(e);
      throw ServerException(message: e.toString());
    }
  }

  Future<void> _firstTimeAddBalanceToUser(UserInfoModel user) async {
    try {
      CollectionReference refCurrency =
          _firebaseFireStore.collection(FirebaseConfig.balanceCollectionKey);

      DocumentSnapshot existingBalanceSnapshot =
          await refCurrency.doc(user.id).get();
      if (existingBalanceSnapshot.exists) {
        debugPrint('User Already have Balance');
        logger.i(UserBalanceModel.fromFireStore(existingBalanceSnapshot));
        return;
      }

      debugPrint('Creating User Balance');
      List<BalanceModel> balanceList = [
        const BalanceModel(currency: 'USD', amount: 10000),
        const BalanceModel(currency: 'SGD', amount: 20000),
      ];

      List<Map<String, dynamic>> serializedBalance =
          balanceList.map((balance) => balance.toJson()).toList();

      await refCurrency
          .doc(user.id)
          .set({'id': user.id, 'balance': serializedBalance});

      DocumentSnapshot documentSnapshot = await refCurrency.doc(user.id).get();

      List<Map<String, dynamic>> balanceData =
          List<Map<String, dynamic>>.from(documentSnapshot.get('balance'));
      List<BalanceModel> deserializedBalance =
          balanceData.map((item) => BalanceModel.fromJson(item)).toList();

      UserBalanceModel userBalance = UserBalanceModel(
        id: documentSnapshot.get('id') as String,
        balance: deserializedBalance,
      );
      logger.i(userBalance);
    } catch (e) {
      logger.e(e);
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserInfoModel> getUser(String email) async {
    try {
      CollectionReference refUser =
          _firebaseFireStore.collection(FirebaseConfig.usersCollectionKey);

      QuerySnapshot querySnapshot =
          await refUser.where('email', isEqualTo: email).limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        UserInfoModel userInfo = UserInfoModel.fromFireStore(documentSnapshot);
        logger.i(userInfo);
        return userInfo;
      } else {
        logger.e('No user found : $email');
        throw Exception('No user found : $email');
      }
    } catch (e) {
      logger.e(e);
      throw ServerException(message: e.toString());
    }
  }
}
