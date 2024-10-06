import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data.dart';


abstract class UserLocalDataSource{
  Future<void> saveUserInfo(UserInfoEntity user);
  Future<UserInfoEntity?> getUserInfo();
  Future<void> deleteUserData();
}

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource{
  final SharedPreferences _prefs;
  UserLocalDataSourceImpl(this._prefs);

  @override
  Future<void> saveUserInfo(UserInfoEntity user) async {
    await _prefs.setString(
      StorageConfig.userInfoKey,
      jsonEncode(UserInfoModel.fromEntity(user).toJson()),
    );
  }

  @override
  Future<UserInfoEntity?> getUserInfo() async {
    final source = _prefs.getString(StorageConfig.userInfoKey);
    return source?.isNotEmpty == true
        ? UserInfoModel.fromJson(jsonDecode(source!))
        : null;
  }

  @override
  Future<void> deleteUserData() async {
    await _prefs.remove(StorageConfig.userInfoKey);
  }


}