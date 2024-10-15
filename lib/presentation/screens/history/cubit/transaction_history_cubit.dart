import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/domain/entities/paginated_transaction.dart';
import '../../../presentation.dart';

part 'transaction_history_state.dart';

part 'transaction_history_cubit.freezed.dart';

@injectable
class TransactionHistoryCubit extends Cubit<TransactionHistoryState> {
  final TransactionRepository _transactionRepository;
  final AuthenticationCubit _auth;
  final ScrollController _scrollController;

  bool _isLoadingMore = false;
  bool _hasMore = true;
  DocumentSnapshot? _lastDocument;
  final Map<DocumentSnapshot, PaginatedTransactionEntity> _paginatedData = {}; // Updated map type

  TransactionHistoryCubit(this._transactionRepository, this._auth)
      : _scrollController = ScrollController(),
        super(const TransactionHistoryState.initial()) {
    _scrollController.addListener(_onScroll); // Listen for scrolling
  }

  ScrollController get historyScrollController => _scrollController;

  // Combine all transactions from _paginatedData
  List<TransactionEntity> get allTransactions {
    return _paginatedData.values
        .expand((paginatedEntity) => paginatedEntity.transactions)
        .toList();
  }

  // Initial load of data
  Future<void> loadData() async {
    final userId = _auth.userId!;
    emit(const TransactionHistoryState.loading());

    // Fetch the initial data
    final result = await _transactionRepository.getTransactionByUser(userId: userId);

    // Add result to _paginatedData linking the lastDocument with PaginatedTransactionEntity
    _lastDocument = result.lastDocument;
    _paginatedData[_lastDocument!] = PaginatedTransactionEntity(
       result.transactions, // Store transactions for this document
       result.lastDocument,  // Store the last document snapshot
    );

    _hasMore = result.transactions.isNotEmpty; // Check if more data is available

    // Emit all transactions from _paginatedData
    emit(TransactionHistoryState.ready(
      allTransactions, // Emit all transactions from the paginated data
      _lastDocument!,
    ));
  }

  // Load more transactions for pagination
  Future<void> loadMoreData() async {
    if (_isLoadingMore || !_hasMore) return; // Prevent loading more if already loading or no more data

    _isLoadingMore = true;
    final userId = _auth.userId!;

    // Fetch more transactions using the last document
    final result = await _transactionRepository.getTransactionByUser(
      userId: userId,
      lastDocument: _lastDocument, // Use the last document for pagination
    );

    // Add the new transactions to _paginatedData and update the lastDocument
    _lastDocument = result.lastDocument;
    _paginatedData[_lastDocument!] = PaginatedTransactionEntity(
       result.transactions, // Add the new batch of transactions
      result.lastDocument, // Update the last document snapshot
    );

    _hasMore = result.transactions.isNotEmpty; // Check if more data is available

    _isLoadingMore = false;

    // Emit all transactions from _paginatedData
    emit(TransactionHistoryState.ready(
      allTransactions, // Emit all transactions from the paginated data
      _lastDocument!,
    ));
  }

  // Detect if the user has scrolled to the bottom
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      loadMoreData(); // Trigger loading more data when near bottom
    }
  }

  @override
  Future<void> close() {
    _scrollController.removeListener(_onScroll); // Remove listener to prevent memory leaks
    _scrollController.dispose();
    return super.close();
  }
}


