import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/domain/domain.dart';
import '../../../../../presentation.dart';

class TransferReadyView extends StatelessWidget {
  final List<UserInfoEntity> walletUsers;

  const TransferReadyView({
    super.key,
    required this.walletUsers,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransferUserCheckCubit, TransferUserCheckState>(
      listener: (context, state) {
        return switch (state) {
          TransferUserCheckSuccess() =>
              context.pushTransferBalance(
                senderBalance: state.senderBalance,
                receiverInfo: state.receiverInfo,
              ),
          TransferUserCheckFail() =>
              showDialog(
                  context: context,
                  builder: (context) {
                    return ErrorDialog(reason: state.failure.reason);
                  }),
          _ => null
        };
      },
      child: BlocSelector<TransferUserCheckCubit, TransferUserCheckState, bool>(
        selector: (state) {
          return switch (state) {
            TransferUserCheckLoading() => true,
            _ => false,
          };
        },
        builder: (context, loading) {
          return LoadingOverlay(
            isLoading: loading,
            loadingInfo: 'Receiver Data Validation',
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return $styles.insets.xs.toHeightSizedBox;
                },
                itemCount: walletUsers.length,
                itemBuilder: (context, index) {
                  return ProfileCardTile(
                    onPressed: () {
                      context
                          .read<TransferUserCheckCubit>()
                          .checkForTransfer(walletUsers[index].email);
                    },
                    imageUrl: walletUsers[index].profileImage ?? '',
                    name: walletUsers[index].name,
                    email: walletUsers[index].email.maskEmail(),
                  );
                }),
          );
        },
      ),
    );
  }
}
