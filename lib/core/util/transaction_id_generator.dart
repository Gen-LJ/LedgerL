import 'package:injectable/injectable.dart';

abstract interface class ITransactionIdGenerator {
  String generate();
}

@Injectable(as: ITransactionIdGenerator)
class TransactionIdGenerator implements ITransactionIdGenerator {
  @override
  String generate() {
    return DateTime.now().millisecondsSinceEpoch.toString() * 2;
  }
}