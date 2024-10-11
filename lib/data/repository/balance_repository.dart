import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/data/data.dart';

import 'package:ledger_l/domain/domain.dart';

@LazySingleton(as: BalanceRepository)
class BalanceRepositoryImpl implements BalanceRepository {
  final BalanceRemoteDataSource _remoteDataSource;

  BalanceRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<BalanceEntity>> getAllBalance(String userId) async {
    try {
      final response = await _remoteDataSource.getAllBalance(userId);
      return response;
    } on SocketException {
      throw const ConnectionFailure();
    } on ServerException {
      throw const ServerFailure();
    }
  }
}
