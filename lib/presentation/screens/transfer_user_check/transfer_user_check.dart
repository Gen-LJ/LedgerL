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
        if (state is TransferUserCheckSuccess) {
          debugPrint('User Check Success listened');
          debugPrint('Receiver data : ${state.receiverInfo}');
          debugPrint('Sender Balance : ${state.senderBalance}');
        }
      },
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
        body:
            BlocSelector<TransferUserCheckCubit, TransferUserCheckState, bool>(
          selector: (state) {
            return switch (state) {
              TransferUserCheckLoading() => true,
              _ => false,
            };
          },
          builder: (context, loading) {
            return LoadingOverlay(
              isLoading: loading,
              loadingInfo: 'Checking Receiver Data',
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: $styles.grid.columnsMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReceiverDataValidateContainer(
                      onValidated: (email) {
                        debugPrint('Validation Success');
                        debugPrint('email: $email');
                        debugPrint('Working on Transfer function');
                        context
                            .read<TransferUserCheckCubit>()
                            .checkForTransfer(email);
                      },
                    ),
                    $styles.grid.columnsMargin.toHeightSizedBox,
                    Text(
                      'Related Users',
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
