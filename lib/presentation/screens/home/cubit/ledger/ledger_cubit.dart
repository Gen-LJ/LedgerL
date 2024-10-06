import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';

import '../../../../presentation.dart';

part 'ledger_state.dart';

part 'ledger_cubit.freezed.dart';

@injectable
class LedgerCubit extends Cubit<LedgerState> {
  final BalanceRepository _balanceRepository;
  final AuthenticationCubit _auth;

  LedgerCubit(this._balanceRepository, this._auth)
      : super(const LedgerState.initial()) {
    loadData();
  }

  Future<void> loadData() async {
    debugPrint('Loading Ledger Data');
    final userId = _auth.userId!;
    final allBalance = await _balanceRepository.getAllBalance(userId);
    emit(state.maybeMap(ready: (state) {
      return state.copyWith(allBalance: allBalance);
    }, orElse: () {
      return LedgerState.ready(allBalance: allBalance);
    }));
  }
}
