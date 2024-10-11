import 'package:injectable/injectable.dart';
import 'package:ledger_l/data/data.dart';
import 'package:ledger_l/domain/domain.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource _remoteDataSource;

  TransactionRepositoryImpl(this._remoteDataSource);

  @override
  Future<TransactionStatusResponseEntity> balanceTransfer({
    required String senderId,
    required String receiverId,
    required String currencyType,
    required num amount,
  }) async {
    final response = await _remoteDataSource.balanceTransfer(
        senderId: senderId,
        receiverId: receiverId,
        currencyType: currencyType,
        amount: amount);
    return response;
  }
}
