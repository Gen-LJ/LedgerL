import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ledger_l/domain/domain.dart';


class PaginatedTransactionEntity {
  final List<TransactionEntity> transactions;
  final DocumentSnapshot lastDocument;

  PaginatedTransactionEntity(this.transactions, this.lastDocument);
}