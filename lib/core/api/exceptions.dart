import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final String? message;
  final http.Response error;

  const ApiException(this.error, {this.message = 'Algo deu errado'});
}

class NotFoundException extends ApiException {
  NotFoundException(super.error, {super.message = 'Usuário não encontrado'});
}

class BadRequestException extends ApiException {
  BadRequestException(super.error, {super.message = 'Erro nos dados enviados'});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.error, {super.message = 'Não autorizado'});
}

class ForbiddenException extends ApiException {
  ForbiddenException(super.error,
      {super.message = 'Não tem permissão para realizar essa operação'});
}

class ServerException extends ApiException {
  ServerException(super.error,
      {super.message = 'Houve um problema com o servidor'});
}

class ConflictException extends ApiException {
  ConflictException(super.error,
      {super.message = 'Conflito encontrado nos dados enviados'});
}

class TooManyRequestsException extends ApiException {
  TooManyRequestsException(super.error,
      {super.message = 'Muitas requisições em um curto período de tempo'});
}

class UnprocessableEntityException extends ApiException {
  UnprocessableEntityException(super.error,
      {super.message = 'Erro ao processar a entidade enviada'});
}

class RequestTimeoutException extends ApiException {
  RequestTimeoutException(super.error,
      {super.message = 'O tempo para completar a requisição expirou'});
}

class NotLoggedUser implements Exception {
  NotLoggedUser();
}
