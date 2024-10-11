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

class NoUserFailure extends Failure {
  const NoUserFailure ([super.meessage = "No User found with this Address"]);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}
