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
    return Padding(
      padding: EdgeInsets.only(
        left: $styles.grid.columnsMargin,
        right: $styles.grid.columnsMargin,
        top: $styles.grid.columnsMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomElevatedButton(
              onPressed: context.pushTransferUserCheck,
              child: Column(
                children: [
                  const Icon(Icons.currency_exchange),
                  $styles.insets.xs.toHeightSizedBox,
                  const Text('Transfer'),
                ],
              )),
          $styles.grid.columnsMargin.toHeightSizedBox,
          Text(
            'Transfer to Users',
            style: context.textTheme.titleMedium,
          ),
          $styles.insets.xs.toHeightSizedBox,
          Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return $styles.insets.xs.toHeightSizedBox;
                  },
                  itemCount: walletUsers.length,
                  itemBuilder: (context, index) {
                    return Text(walletUsers[index].email);
                  }))
        ],
      ),
    );
  }
}
