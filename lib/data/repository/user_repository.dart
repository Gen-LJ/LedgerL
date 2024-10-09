import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/data/data.dart';
import 'package:ledger_l/domain/domain.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _local;
  final UserRemoteDataSource _remote;

  UserRepositoryImpl(this._local, this._remote);

  @override
  Future<UserInfoEntity> saveUser(UserInfoEntity user) async {
    try {
      final userInfoModel = UserInfoModel.fromEntity(user);
      final userFromServer = await _remote.saveUser(userInfoModel);
      await _local.saveUserInfo(userFromServer);
      return userFromServer;
    } on SocketException {
      throw const ConnectionFailure();
    } on ServerException {
      throw const ServerFailure();
    }
  }

  @override
  Future<UserInfoEntity?> getSavedUserInfo() async {
    return _local.getUserInfo();
  }

  @override
  Future<UserInfoEntity> getUserInfo(String email) async {
    try {
      final user = await _remote.getUser(email);
      return user;
    } on ServerException {
      throw const ServerFailure();
    } on SocketException {
      throw const ConnectionFailure();
    }
  }

  @override
  Future<UserInfoEntity> updateUserInfo(UserInfoEntity user) {
    // TODO: implement updateUserInfo
    throw UnimplementedError();
  }

  @override
  Future<void> removeUserInfo() async {
    await _local.deleteUserData();
  }

  @override
  Future<List<UserInfoEntity>> getAllWalletUserData() async {
    try {
      // bool onlineStatus = await isOnline();
      // if (onlineStatus) {
      List<UserInfoEntity> walletUsers = await _remote.getAllUsers();
      // await _local.saveAllWalletUsers(walletUsers);
      return walletUsers;
      // } else {
      //   List<UserInfoEntity>? walletUsers = await _local.getAllUsers();
      //   if (walletUsers == null) {
      //     throw SocketException;
      //   }
      //   return walletUsers;
      // }
    } on SocketException {
      throw const ConnectionFailure();
    } on ServerException {
      throw const ServerFailure();
    }
  }
}
