import 'package:flutter/material.dart';

import '../../presentation.dart';

void showLogoutConfirmation(BuildContext context,void Function() onPressed) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: [
          ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Text(
              'Are you sure you want to logout?',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  right: $styles.grid.columnsMargin,
                  left: $styles.grid.columnsMargin,
                  bottom: $styles.grid.columnsMargin),
              child: ConfirmCancelRowButton(
                name: 'Logout',
                onPressed: onPressed,
              )),
        ],
      );
    },
  );
}