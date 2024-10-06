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
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  BalanceRemoteDataSourceImpl(this._firebaseFireStore);

  @override
  Future<List<BalanceModel>> getAllBalance(String userId) async {
    try {
      CollectionReference refCurrency =
          _firebaseFireStore.collection(FirebaseConfig.currencyCollectionKey);
      DocumentSnapshot documentSnapshot = await refCurrency.doc(userId).get();

      List<Map<String, dynamic>> balanceData =
      List<Map<String, dynamic>>.from(documentSnapshot.get(FirebaseConfig.currencyCollectionKey));
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
