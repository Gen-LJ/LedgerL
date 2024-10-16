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
          return switch (state) {
            AuthLoading() => {
                'loading': true,
                'message': state.message,
              },
            _ => {
                'loading': false,
                'message': null,
              },
          };
        },
        builder: (context, loadingInfo) {
          return LoadingOverlay(
            isLoading: loadingInfo['loading'],
            loadingInfo: loadingInfo['message'],
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      left: $styles.grid.columnsMargin,
                      right: $styles.grid.columnsMargin,
                      top: $styles.grid.columnsMargin ),
                  child: Column(
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
                        },
                      ),
                      $styles.insets.sm.toHeightSizedBox,
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                  padding: EdgeInsets.all($styles.grid.columnsMargin),
                  child: RichText(
                      text: TextSpan(
                          style: context.textTheme.labelSmall
                              ?.copyWith(fontSize: 10),
                          children: [
                        TextSpan(
                            text: 'Note: ',
                            style: context.textTheme.labelSmall?.copyWith(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                        const TextSpan(
                            text:
                                'As part of the first-time login process, users will be randomly awarded two different currencies with amounts of 10,000 and 20,000. The currencies in this project are only used for logical operations such as transfers and are purely imaginary.'),
                      ]))),
            ),
          );
        },
      ),
    );
  }
}
