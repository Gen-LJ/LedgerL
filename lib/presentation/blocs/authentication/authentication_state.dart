part of 'authentication_cubit.dart';

@freezed
sealed class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = AuthInitial;
  const factory AuthenticationState.authenticated({
    required UserInfoEntity user,
  }) = Authenticated;
}
