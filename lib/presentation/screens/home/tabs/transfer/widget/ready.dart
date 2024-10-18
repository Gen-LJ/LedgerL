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
    return ListView.separated(
        separatorBuilder: (context, index) {
          return $styles.insets.xs.toHeightSizedBox;
        },
        itemCount: walletUsers.length,
        itemBuilder: (context, index) {
          return ProfileCardTile(
            imageUrl: walletUsers[index].profileImage ?? '',
            name: walletUsers[index].name,
            email: walletUsers[index].email.maskEmail(),
          );
        });
  }
}
