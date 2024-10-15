import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/data/data.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/domain/entities/paginated_transaction.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource _remoteDataSource;

  TransactionRepositoryImpl(this._remoteDataSource);

  @override
  Future<TransactionStatusResponseEntity> balanceTransfer({
    required String senderId,
    required String receiverId,
    required String receiverEmail,
    required String currencyType,
    required int amount,
  }) async {
    final response = await _remoteDataSource.balanceTransfer(
        senderId: senderId,
        receiverId: receiverId,
        receiverEmail: receiverEmail,
        currencyType: currencyType,
        amount: amount);
    return response;
  }

  @override
  Future<PaginatedTransactionEntity> getTransactionByUser(
      {required String userId, DocumentSnapshot? lastDocument}) async {
    try {
      final response = await _remoteDataSource.getTransactionsByUserId(userId,
          lastDocument: lastDocument);
      return response;
    } catch (e) {
      if (e is ServerException) {
        throw ServerFailure(e.message ?? 'Something Wrong');
      } else {
        throw const ServerFailure();
      }
    }
  }
}
