import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';

part 'transfer_view_state.dart';
part 'transfer_view_cubit.freezed.dart';

@injectable
class TransferViewCubit extends Cubit<TransferViewState> {
  final UserRepository _userRepository;
  TransferViewCubit(this._userRepository) : super(const TransferViewState.initial()){
    debugPrint('Load Data call at cubit');
    loadData();
  }

  Future<void> loadData() async {
    emit(const TransferViewState.loading());
    debugPrint('Loading Transfer Data');
    final user = await _userRepository.getSavedUserInfo();
    final res = await _userRepository.getAllWalletUserData();
    res.remove(user);
    emit(TransferViewState.ready(walletUsers: res));
  }
}
