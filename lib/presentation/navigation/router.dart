import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/presentation/presentation.dart';

@lazySingleton
class NavigationRouter {

  void Function(int page) Function()? _useIndexPageNavigator;

  void Function(int page) Function() get useIndexPageNavigator =>
      _useIndexPageNavigator!;

  static const mustAuthenticatedRoute = [
    IndexScreen.routePath,
  ];
  late final router = GoRouter(
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
              return IndexScreen(
                hookCallback: (useIndexPageNavigator) {
                  _useIndexPageNavigator = useIndexPageNavigator;
                },
              );
            },
            routes: [
              GoRoute(
                  onExit: (context, state) {
                    final auth = context.read<AuthenticationCubit>();
                    if (auth.state is! Authenticated) {
                      SystemNavigator.pop();
                    }
                    return true;
                  },
                  path: LoginScreen.routeName,
                  builder: (context, state) {
                    final redirectRoute =
                        state.uri.queryParameters["redirectRoute"];
                    return LoginScreen(redirectRoute: redirectRoute);
                  }),
            ])
      ]);
}
