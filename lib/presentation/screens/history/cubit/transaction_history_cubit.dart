import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
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
  final Map<DocumentSnapshot, PaginatedTransactionEntity> _paginatedData = {};

  TransactionHistoryCubit(this._transactionRepository, this._auth)
      : _scrollController = ScrollController(),
        super(const TransactionHistoryState.initial()) {
    _scrollController.addListener(_onScroll);
  }

  ScrollController get historyScrollController => _scrollController;

  bool get isLoadingMore => _isLoadingMore;

  Future<void> loadData() async {
    _isLoadingMore = false;
    _paginatedData.clear();
    final userId = _auth.userId!;
    emit(const TransactionHistoryState.loading());

    try {
      final result =
          await _transactionRepository.getTransactionByUser(userId: userId);

      _lastDocument = result.lastDocument;
      _paginatedData[_lastDocument!] = PaginatedTransactionEntity(
        result.transactions,
        result.lastDocument,
      );

      _hasMore = result.transactions.isNotEmpty;

      final values = _paginatedData.values;
      emit(TransactionHistoryState.ready(
        values.fold([], (p, e) => [...p, ...e.transactions]),
        _lastDocument!,
      ));
    } on ServerFailure {
      emit(const TransactionHistoryState.error('No transactions found.'));
    }
  }

  Future<void> loadMoreData() async {
    if (_isLoadingMore || !_hasMore) {
      return;
    }

    _isLoadingMore = true;
    final userId = _auth.userId!;

    final result = await _transactionRepository.getTransactionByUser(
      userId: userId,
      lastDocument: _lastDocument,
    );

    _lastDocument = result.lastDocument;
    _paginatedData[_lastDocument!] = PaginatedTransactionEntity(
      result.transactions,
      result.lastDocument,
    );

    final values = _paginatedData.values;

    _hasMore = result.transactions.isNotEmpty;

    _isLoadingMore = false;

    emit(TransactionHistoryState.ready(
      values.fold([], (p, e) => [...p, ...e.transactions]),
      _lastDocument!,
    ));
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      loadMoreData();
    }
  }

  @override
  Future<void> close() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    return super.close();
  }
}
