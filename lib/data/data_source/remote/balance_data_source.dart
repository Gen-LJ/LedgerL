import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/data/models/balance/balance.dart';
import 'package:logger/logger.dart';

abstract class BalanceRemoteDataSource {
  Future<List<BalanceModel>> getAllBalance(String userId);
}

@LazySingleton(as: BalanceRemoteDataSource)
class BalanceRemoteDataSourceImpl implements BalanceRemoteDataSource {
  final FirebaseFirestore _firebaseFireStore;
  final Logger logger;

  BalanceRemoteDataSourceImpl(this._firebaseFireStore, this.logger);

  @override
  Future<List<BalanceModel>> getAllBalance(String userId) async {
    try {
      CollectionReference refBalance =
          _firebaseFireStore.collection(FirebaseConfig.balanceCollectionKey);
      DocumentSnapshot documentSnapshot = await refBalance.doc(userId).get();

      List<Map<String, dynamic>> balanceData = List<Map<String, dynamic>>.from(
          documentSnapshot.get(FirebaseConfig.balanceCollectionKey));
      List<BalanceModel> deserializedBalance =
          balanceData.map((item) => BalanceModel.fromJson(item)).toList();

      logger.i(deserializedBalance);
      return deserializedBalance;
    } catch (e) {
      logger.e(e);
      throw ServerException(message: e.toString());
    }
  }
}
