import 'package:ledger_l/domain/domain.dart';

abstract interface class UserRepository {
  Future<UserInfoEntity> saveUser(UserInfoEntity user);

  Future<UserInfoEntity?> getUserInfo();

  Future<UserInfoEntity> updateUserInfo(UserInfoEntity user);

  Future<void> removeUserInfo();

  Future<List<UserInfoEntity>> getAllWalletUserData();
}
