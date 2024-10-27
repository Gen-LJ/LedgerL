import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/presentation.dart';

@lazySingleton
class NavigationRouter {
  final INavigationKeyProvider _navigationKeyProvider;

  NavigationRouter(this._navigationKeyProvider);

  void Function(int page) Function()? _useIndexPageNavigator;

  void Function(int page) Function() get useIndexPageNavigator =>
      _useIndexPageNavigator!;

  static const mustAuthenticatedRoute = [
    IndexScreen.routePath,
  ];
  late final router = GoRouter(
      navigatorKey: _navigationKeyProvider.globalKey,
      initialLocation: IndexScreen.routePath,
      redirect: (context, state) async {
        final currentRoute = state.fullPath;
        if (mustAuthenticatedRoute.contains(currentRoute)) {
          final auth = context.read<AuthenticationCubit>();
          if (auth.state is! Authenticated) {
            return LoginScreen.createRoute(redirectRoute: state.uri.toString());
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: IndexScreen.routePath,
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => inject<LedgerCubit>()),
                BlocProvider(create: (_) => inject<TransferViewCubit>()),
                BlocProvider(
                    create: (_) => inject<TransferUserCheckCubit>()),
              ],
              child: IndexScreen(
                indexCallback: (useIndexPageNavigator) {
                  _useIndexPageNavigator = useIndexPageNavigator;
                },
              ),
            );
          },
          routes: [
            GoRoute(
              path: TransferUserCheckScreen.routeName,
              builder: (context, state) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (_) => inject<TransferUserCheckCubit>()),
                    BlocProvider(
                        create: (_) => inject<ReceiverDataValidationCubit>()),
                  ],
                  child: const TransferUserCheckScreen(),
                );
              },
            ),
            GoRoute(
              path: TransferBalanceScreen.routeName,
              builder: (context, state) {
                final extras = state.extra as List<dynamic>;
                final List<BalanceEntity> senderBalance =
                    extras[0] as List<BalanceEntity>;
                final UserInfoEntity receiverInfo = extras[1] as UserInfoEntity;
                return BlocProvider(
                  create: (_) => inject<TransferBalanceCubit>(),
                  child: TransferBalanceScreen(
                    senderBalance: senderBalance,
                    receiverInfo: receiverInfo,
                  ),
                );
              },
            ),
            GoRoute(
                path: TransactionDetailScreen.routeName,
                builder: (context, state) {
                  final extras = state.extra as List<dynamic>;
                  final TransactionEntity transactionDetails =
                      extras[0] as TransactionEntity;
                  final bool isSender = extras[1] as bool;
                  return TransactionDetailScreen(
                    transactionDetails: transactionDetails,
                    isSender: isSender,
                  );
                })
          ],
        ),
        GoRoute(
            onExit: (context, state) {
              final auth = context.read<AuthenticationCubit>();
              if (auth.state is! Authenticated) {
                SystemNavigator.pop();
              }
              return true;
            },
            path: LoginScreen.routePath,
            builder: (context, state) {
              final redirectRoute = state.uri.queryParameters["redirectRoute"];
              return LoginScreen(redirectRoute: redirectRoute);
            }),
        GoRoute(
            onExit: (context, state) {
              context.goIndex();
              return true;
            },
            path: TransferSuccessScreen.routePath,
            builder: (context, state) {
              final extras = state.extra as TransactionEntity;
              debugPrint('Transaction Data = $extras');
              return TransferSuccessScreen(
                transactionData: extras,
              );
            })
      ]);
}
