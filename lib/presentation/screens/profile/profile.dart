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
        body: Center(
          child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('ID - ${state.user.id}'),
                    Text('Email - ${state.user.email}'),
                  ],
                );
              }
              return const Text('Auth Required');
            },
          ),
        ),
      ),
    );
  }
}
