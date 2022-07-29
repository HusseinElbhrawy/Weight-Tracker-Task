import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);
  @override
  List<Object?> get props => [message];
  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  const FetchDataException([String? message])
      : super('Error During Communication');
}

class BadRequestException extends ServerException {
  const BadRequestException([String? message]) : super('Bad Request');
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([String? message]) : super('Unauthorized');
}

class NotFoundException extends ServerException {
  const NotFoundException([String? message]) : super('Request Info Not Found');
}

class ConflictException extends ServerException {
  const ConflictException([String? message]) : super('Conflict Occurred');
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([String? message])
      : super('Internal Server Error');
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([String? message])
      : super('No Internet Connection');
}

class CachedException implements Exception {}
