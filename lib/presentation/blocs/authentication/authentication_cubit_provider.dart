
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';
import 'authentication_cubit.dart';

@module
abstract class AuthenticationCubitProvider {
  @preResolve
  @singleton
  Future<AuthenticationCubit> provide(
   FirebaseAuth auth,
   GoogleSignIn googleSignIn,
   UserRepository userRepository,
  ) async {
    final instance = AuthenticationCubit(
    auth,
    googleSignIn,
    userRepository,
    );
    await instance.loadData();
    return instance;
  }
}
