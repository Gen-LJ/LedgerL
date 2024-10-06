import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GoogleSignInModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();
}