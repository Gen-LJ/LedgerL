import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';

part 'transfer_state.dart';
part 'transfer_cubit.freezed.dart';

@injectable
class TransferCubit extends Cubit<TransferState> {
  final UserRepository _userRepository;
  TransferCubit(this._userRepository) : super(const TransferState.initial()){
    debugPrint('Load Data call at cubit');
    loadData();
  }

  Future<void> loadData() async {
    debugPrint('Loading Transfer Data');
    final user = await _userRepository.getUserInfo();
    final res = await _userRepository.getAllWalletUserData();
    res.remove(user);
    emit(TransferState.ready(walletUsers: res));
  }
}
