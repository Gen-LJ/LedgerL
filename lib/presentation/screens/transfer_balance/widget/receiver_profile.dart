import 'package:flutter/material.dart';
import 'package:ledger_l/domain/domain.dart';
import '../../../presentation.dart';

class ReceiverProfile extends StatelessWidget {
  const ReceiverProfile({
    super.key,
    required this.receiverInfo,
  });

  final UserInfoEntity receiverInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: $styles.grid.columnsMargin,
        right: $styles.grid.columnsMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: R.strings.lblTo),
          ProfileCardTile(
            imageUrl: receiverInfo.profileImage ?? '',
            name: receiverInfo.name,
            email: receiverInfo.email.maskEmail(),
          ),
        ],
      ),
    );
  }
}