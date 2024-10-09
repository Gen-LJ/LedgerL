import 'package:flutter/material.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        $styles.grid.columnsMargin.toHeightSizedBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: $styles.grid.columnsMargin),
          child: const Text('Users'),
        ),
        $styles.insets.sm.toHeightSizedBox,
        Expanded(
            child: ListView.separated(
                padding: EdgeInsets.symmetric(
                    horizontal: $styles.grid.columnsMargin),
                separatorBuilder: (context, index) {
                  return $styles.insets.xs.toHeightSizedBox;
                },
                itemCount: walletUsers.length,
                itemBuilder: (context, index) {
                  return Text(walletUsers[index].email);
                }))
      ],
    );
  }
}