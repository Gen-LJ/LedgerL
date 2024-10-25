import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/presentation/presentation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is! Authenticated) {
          context.goIndex();
        }
      },
      child: Scaffold(
        body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: $styles.grid.columnsMargin,
                  vertical: $styles.grid.columnsMargin,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileCardTile(
                      imageUrl: state.user.profileImage ?? '',
                      name: state.user.name,
                      email: state.user.email.maskEmail(),
                    ),
                  ],
                ),
              );
            }
            return Center(child: Text(R.strings.lblAuthRequired));
          },
        ),
      ),
    );
  }
}
