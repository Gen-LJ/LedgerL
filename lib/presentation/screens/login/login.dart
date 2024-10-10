import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ledger_l/presentation/presentation.dart';

class LoginScreen extends StatelessWidget {
  final String? redirectRoute;

  const LoginScreen({super.key, this.redirectRoute});

  static const String routeName = "login";
  static const String routePath = "/$routeName";

  static String createRoute({String? redirectRoute}) {
    return "$routePath?${redirectRoute == null ? '' : 'redirectRoute=$redirectRoute'}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is Authenticated) {
          redirectRoute != null
              ? context.go(redirectRoute!)
              : context.goIndex();
        }
      },
      child: BlocSelector<AuthenticationCubit, AuthenticationState,
          Map<String, dynamic>>(
        selector: (state) {
          if (state is AuthLoading) {
            return {'isLoading': true, 'loadingMessage': state.message};
          }
          return {'isLoading': false, 'loadingMessage': ''};
        },
        builder: (context, loadingInfo) {
          return LoadingOverlay(
            isLoading: loadingInfo['isLoading'],
            loadingInfo: loadingInfo['loadingMessage'],
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: $styles.grid.columnsMargin),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (context.height / 4).toHeightSizedBox,
                      SvgPicture.asset(
                        R.images.appLogo,
                        height: $styles.size.size100 * 12,
                      ),
                      Text(
                        R.strings.lblWelcome,
                        style: context.textTheme.titleMedium,
                      ),
                      $styles.insets.md.toHeightSizedBox,
                      LoginElevatedButton(
                          imagePath: R.images.googleLogo,
                          text: R.strings.lblAuthRequired,
                          onPressed: () {
                            context
                                .read<AuthenticationCubit>()
                                .signInWithGoogle();
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
