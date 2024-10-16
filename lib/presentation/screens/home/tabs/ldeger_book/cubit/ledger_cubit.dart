import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/blocs/blocs.dart';

part 'ledger_state.dart';

part 'ledger_cubit.freezed.dart';

@injectable
class LedgerCubit extends Cubit<LedgerState> {
  final BalanceRepository _balanceRepository;
  final AuthenticationCubit _auth;

  LedgerCubit(this._balanceRepository, this._auth)
      : super(const LedgerState.initial());

  Future<void> loadData() async {
    emit(const LedgerState.loading());
    debugPrint('Loading Ledger Data');
    final userId = _auth.userId!;
    final allBalance = await _balanceRepository.getAllBalance(userId);
    emit(LedgerState.ready(allBalance: allBalance));
  }
}
