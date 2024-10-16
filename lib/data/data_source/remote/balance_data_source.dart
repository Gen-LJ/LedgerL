import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:logger/logger.dart';
import '../../data.dart';

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

      Map<String, dynamic> balanceData =
      Map<String, dynamic>.from(documentSnapshot.get('balance'));

      List<BalanceModel> deserializedBalance = balanceData.entries
          .map((entry) => BalanceModel(currency: entry.key, amount: entry.value as num))
          .toList();

      logger.i(deserializedBalance);
      return deserializedBalance;
    } catch (e) {
      logger.e(e);
      throw ServerException(message: e.toString());
    }
  }

}
