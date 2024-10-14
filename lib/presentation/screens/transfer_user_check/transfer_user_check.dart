import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation.dart';

class TransferUserCheckScreen extends StatelessWidget {
  const TransferUserCheckScreen({super.key});

  static const String routeName = "transfer-user-check";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransferUserCheckCubit, TransferUserCheckState>(
      listener: (context, state) {
        return switch (state) {
          TransferUserCheckSuccess() => context.pushTransferBalance(
              senderBalance: state.senderBalance,
              receiverInfo: state.receiverInfo,
            ),
          TransferUserCheckFail() => showDialog(
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
            child: Scaffold(
                appBar: AdaptiveBackAppbar(
                  title: Text(
                    R.strings.lblTransfer,
                    style: context.textTheme.titleLarge,
                  ),
                  actions: [
                    TextButton(
                      onPressed: context.goHistory,
                      child: Text(R.strings.lblHistory),
                    )
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $styles.grid.columnsMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReceiverDataValidateContainer(
                        onValidated: (email) {
                          context
                              .read<TransferUserCheckCubit>()
                              .checkForTransfer(email);
                        },
                      ),
                      $styles.grid.columnsMargin.toHeightSizedBox,
                      Text(
                        'Recent Transfer',
                        style: context.textTheme.titleMedium,
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
