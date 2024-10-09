import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';


@LazySingleton(as : TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository{
  @override
  Future<StatusResponseEntity> balanceTransfer({required String senderId, required String receiverId, required String currencyType, required num amount}) {
    // TODO: implement balanceTransfer
    throw UnimplementedError();
  }

}