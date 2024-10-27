import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/presentation/presentation.dart';

class LedgerL extends StatelessWidget {
  const LedgerL({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => inject<AuthenticationCubit>()),
        BlocProvider(create: (_) => inject<AppSettingCubit>()),
        BlocProvider(create: (_) => inject<TransactionHistoryCubit>()),
      ],
      child: BlocBuilder<AppSettingCubit, AppSettingState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: $styles.light,
            darkTheme: $styles.dark,
            routerConfig: inject<NavigationRouter>().router,
          );
        },
      ),
    );
  }
}