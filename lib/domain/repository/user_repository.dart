import 'package:ledger_l/domain/domain.dart';

abstract interface class UserRepository {
  Future<UserInfoEntity> saveUser(UserInfoEntity user);

  Future<UserInfoEntity?> getSavedUserInfo();

  Future<UserInfoEntity> getUserInfo(String email);

  Future<UserInfoEntity> updateUserInfo(UserInfoEntity user);

  Future<void> removeUserInfo();

  Future<List<UserInfoEntity>> getAllWalletUserData();
}
