import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/domain/domain.dart';
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

  ScrollController get scrollController => _scrollController;

  bool get isLoadingMore => _isLoadingMore;

  Future<void> loadData() async {
    _resetPagination();
    emit(const TransactionHistoryState.loading());

    try {
      final userId = _auth.userId!;
      final result =
          await _transactionRepository.getTransactionByUser(userId: userId);

      _lastDocument = result.lastDocument;
      _updatePaginatedData(result);

      emit(TransactionHistoryState.ready(
        transactions: _getAllTransactions(),
        lastDocument: _lastDocument!,
      ));
    } on ServerFailure {
      emit(const TransactionHistoryState.error('No transactions found.'));
    }
  }

  Future<void> loadMoreData() async {
    if (_shouldNotLoadMore()) return;

    _startLoadingMore();
    final userId = _auth.userId!;

    try {
      final result = await _transactionRepository.getTransactionByUser(
        userId: userId,
        lastDocument: _lastDocument,
      );

      _lastDocument = result.lastDocument;
      _updatePaginatedData(result);

      _hasMore = result.transactions.isNotEmpty;
      await Future.delayed(const Duration(seconds: 1)); //This is to certify loading more indicator
      _stopLoadingMore();
      emit(TransactionHistoryState.ready(
        transactions: _getAllTransactions(),
        lastDocument: _lastDocument!,
      ));
    } catch (e) {
      _stopLoadingMore();
      _hasMore = false;
    }
  }

  void _onScroll() {
    if (_isNearBottom()) loadMoreData();
  }

  bool _isNearBottom() =>
      _scrollController.offset >=
          _scrollController.position.maxScrollExtent * 0.9 &&
      !_scrollController.position.outOfRange;

  void _resetPagination() {
    _isLoadingMore = false;
    _hasMore = true;
    _paginatedData.clear();
  }

  void _updatePaginatedData(PaginatedTransactionEntity result) {
    _paginatedData[_lastDocument!] = PaginatedTransactionEntity(
      result.transactions,
      result.lastDocument,
    );
  }

  List<TransactionEntity> _getAllTransactions() {
    return _paginatedData.values
        .fold([], (prev, entity) => [...prev, ...entity.transactions]);
  }

  bool _shouldNotLoadMore() => _isLoadingMore || !_hasMore;

  void _startLoadingMore() {
    _isLoadingMore = true;
    emit(state.maybeMap(
      ready: (state) => state.copyWith(loadingMore: _isLoadingMore),
      orElse: () => state,
    ));
  }

  void _stopLoadingMore() {
    _isLoadingMore = false;
    emit(state.maybeMap(
      ready: (state) => state.copyWith(loadingMore: _isLoadingMore),
      orElse: () => state,
    ));
  }

  @override
  Future<void> close() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    return super.close();
  }
}
