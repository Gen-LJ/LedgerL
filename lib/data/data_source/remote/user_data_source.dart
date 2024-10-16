import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/data/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:logger/logger.dart';
import 'dart:math';

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
        await _firstTimeBalanceChecker(user);
        logger.i(user);
        return UserInfoModel.fromFireStore(documentSnapshot);
      } else {
        debugPrint('Creating User Data');
        CollectionReference refUser =
            _firebaseFireStore.collection(FirebaseConfig.usersCollectionKey);
        await refUser.doc(user.id).set(user.toJson());
        await _firstTimeBalanceChecker(user);
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
      CollectionReference refUser =
          _firebaseFireStore.collection(FirebaseConfig.usersCollectionKey);

      QuerySnapshot querySnapshot = await refUser.get();

      List<UserInfoModel> users = querySnapshot.docs.map((doc) {
        return UserInfoModel.fromFireStore(
            doc);
      }).toList();

      logger.i(users);
      return users;
    } catch (e) {
      logger.e(e);
      throw ServerException(message: e.toString());
    }
  }



  Future<void> _firstTimeBalanceChecker(UserInfoModel user) async {
    try {
      CollectionReference refCurrency =
      _firebaseFireStore.collection(FirebaseConfig.balanceCollectionKey);

      DocumentSnapshot existingBalanceSnapshot = await refCurrency.doc(user.id).get();
      if (existingBalanceSnapshot.exists) {
        debugPrint('User Already has Balance');
        logger.i(UserBalanceModel.fromFireStore(existingBalanceSnapshot));
        return;
      }

      debugPrint('Creating User Balance');

      const List<Currency> availableCurrencies = Currency.values;

      final random = Random();

      final List<Currency> selectedCurrencies = [];
      while (selectedCurrencies.length < 2) {
        final randomCurrency = availableCurrencies[random.nextInt(availableCurrencies.length)];
        if (!selectedCurrencies.contains(randomCurrency)) {
          selectedCurrencies.add(randomCurrency);
        }
      }

      // Map with random currencies (using enum code) and their respective amounts
      Map<String, num> balanceMap = {
        selectedCurrencies[0].code: 10000,
        selectedCurrencies[1].code: 20000,
      };

      await refCurrency.doc(user.id).set({'id': user.id, 'balance': balanceMap});

      DocumentSnapshot documentSnapshot = await refCurrency.doc(user.id).get();

      Map<String, dynamic> balanceData =
      Map<String, dynamic>.from(documentSnapshot.get('balance'));

      List<BalanceModel> deserializedBalance = balanceData.entries
          .map((entry) => BalanceModel(currency: entry.key, amount: entry.value as num))
          .toList();

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
        throw Exception('No user found : $email');
      }
    } catch (e) {
      logger.e(e);
      if(e.toString().contains('No user found')) {
        throw NoUserException(message: e.toString());
      } else {
        throw ServerException(message: e.toString());
      }
    }
  }
}
