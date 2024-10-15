import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/blocs/authentication/authentication_cubit.dart';

part 'transaction_history_state.dart';

part 'transaction_history_cubit.freezed.dart';

@injectable
class TransactionHistoryCubit extends Cubit<TransactionHistoryState> {
  final TransactionRepository _transactionRepository;
  final AuthenticationCubit _auth;

  TransactionHistoryCubit(this._transactionRepository, this._auth)
      : super(const TransactionHistoryState.initial());

  Future<void> loadData() async {
    debugPrint('Loading History Data');
    final userId = _auth.userId!;
    final allBalance =
        await _transactionRepository.getTransactionByUser(userId);
    emit(TransactionHistoryState.ready(allBalance));
  }
}
