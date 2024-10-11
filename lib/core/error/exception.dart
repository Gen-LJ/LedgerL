class ServerException implements Exception {
  final String? message;

  ServerException({ this.message});
}


class NoUserException  implements Exception{
  final String? message;

  NoUserException({ this.message});
}