import 'package:flutter/material.dart';
import 'package:ledger_l/core/core.dart';

import '../../../presentation.dart';
import 'cubit/transfer_user_check_cubit.dart';

class ReceiverDataCheckContainer extends StatelessWidget {
  const ReceiverDataCheckContainer({
    super.key, this.onValidated,
  });

  final void Function(String phoneNumber)? onValidated;


  @override
  Widget build(BuildContext context) {
    final bloc = inject<TransferUserCheckCubit>()..onValidated = onValidated;

    return Container(
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular($styles.insets.xs),
      ),
      padding: EdgeInsets.all($styles.insets.xs * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter Receiver Gmail Address',
            style: context.textTheme.titleMedium,
          ),
          $styles.insets.xs.toHeightSizedBox,
          Row(
            children: [
              Image.asset(
                R.images.googleLogo,
                height: $styles.size.size500,
              ),
              $styles.insets.xs.toWidthSizedBox,
              Expanded(
                child: Form(
                  key: bloc.formKey,
                  child: TextFormField(
                    controller: bloc.textEditingController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: bloc.focusNode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Address cannot be empty";
                      }
                      if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                          .hasMatch(value)) {
                        return ('Wrong gmail format');
                      } else {
                        return null;
                      }
                    },
                    onFieldSubmitted: (address) {
                      bloc.onNextTap(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          $styles.insets.sm.toHeightSizedBox,
          CustomElevatedButton(
              onPressed: () {
                bloc.onNextTap(context);
              },
              child: const Text('Next')),
        ],
      ),
    );
  }
}