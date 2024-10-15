import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ledger_l/data/data.dart';
import 'package:ledger_l/domain/entities/paginated_transaction.dart';

part 'paginated_transaction.freezed.dart';

@freezed
class PaginatedTransactionModel extends PaginatedTransactionEntity with _$PaginatedTransactionModel {
  const factory PaginatedTransactionModel({
    required List<TransactionModel> transactions,
    required DocumentSnapshot lastDocument,
  }) = _PaginatedTransactionModel;
}