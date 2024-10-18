import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../domain/domain.dart';

part 'authentication_state.dart';

part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final UserRepository _userRepository;

  AuthenticationCubit(
    this._auth,
    this._googleSignIn,
    this._userRepository,
  ) : super(const AuthenticationState.initial());

  String? get userId =>
      switch (state) { Authenticated(user: final user) => user.id, _ => null };

  String? get userEmail => switch (state) {
        Authenticated(user: final user) => user.email,
        _ => null
      };

  String? get userName =>
      switch (state) { Authenticated(user: final user) => user.name, _ => null };

  Future<void> loadData() async {
    final user = await _userRepository.getSavedUserInfo();

    if (user != null) {
      emit(AuthenticationState.authenticated(user: user));
    }
  }

  Future<void> signInWithGoogle() async {
    _updateLoadingState('Initializing');

    await _googleSignIn.signOut();

    _updateLoadingState('Retrieving Accounts');
    final googleSignInAccount = await _googleSignIn.signIn();

    if (googleSignInAccount == null) {
      emit(const AuthenticationState.initial());
      return;
    }

    _updateLoadingState('Checking Credential');
    final googleSignInAuthentication = await googleSignInAccount.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    _updateLoadingState('Signing In');
    await _auth.signInWithCredential(credential);

    await authenticateUser(UserInfoEntity(
      id: googleSignInAccount.id,
      email: googleSignInAccount.email,
      name: googleSignInAccount.displayName ?? googleSignInAccount.email,
      profileImage: googleSignInAccount.photoUrl,
    ));
  }

  void _updateLoadingState(String message) {
    emit(state.maybeMap(
      loading: (loadingState) => loadingState.copyWith(message: message),
      orElse: () => AuthenticationState.loading(message: message),
    ));
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<void> authenticateUser(UserInfoEntity user) async {
    await _userRepository.saveUser(user);
    emit(AuthenticationState.authenticated(user: user));
  }

  Future<void> logOut() async {
    await _signOut();
    await _userRepository.removeUserInfo();
    emit(const AuthenticationState.initial());
  }
}
