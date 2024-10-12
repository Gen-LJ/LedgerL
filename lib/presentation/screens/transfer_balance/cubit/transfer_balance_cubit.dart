
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';

part 'transfer_balance_state.dart';
part 'transfer_balance_cubit.freezed.dart';

@injectable
class TransferBalanceCubit extends Cubit<TransferBalanceState> {
  int _currentIndex = 0;
  BalanceEntity? _currency;

  TransferBalanceCubit() : super( const TransferBalanceState.initial(0,null));

  int get currentIndex => _currentIndex;
  BalanceEntity? get currency => _currency;

  void onTapCurrency({required int index,required BalanceEntity currency}){
    _currentIndex = index;
    _currency = currency;
    emit(state.copyWith(currentIndex: _currentIndex,currency: currency));
  }
}
