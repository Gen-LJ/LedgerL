import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies();
  runApp(const LedgerL());
}
