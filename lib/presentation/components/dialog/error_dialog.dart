import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ledger_l/presentation/presentation.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key, required this.reason,
  });

  final String reason;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error',style: context.textTheme.titleLarge?.copyWith(color: Colors.red),),
      content: Text(reason,style: context.textTheme.bodyMedium,maxLines: 10,),
      actions: [
        CustomElevatedButton(
            onPressed: context.pop,
            child: const Text('Ok'))],
    );
  }
}