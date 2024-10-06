abstract class Failure {
  final String reason;

  const Failure(this.reason);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'An Error has occurred']);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([super.message = "Failed to connect to the Network"]);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}
