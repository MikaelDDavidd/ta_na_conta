// Classe abstrata base para exceções da aplicação
abstract class AppException implements Exception {
  final String message;
  const AppException([this.message = '']);

  @override
  String toString() => message.isEmpty ? 'AppException' : 'AppException: $message';
}

class InvalidParameterException extends AppException {
  const InvalidParameterException([String message = 'Parâmetro inválido']) : super(message);
}

class NoInternetException extends AppException {
  const NoInternetException([String message = 'Sem conexão com a internet'])
      : super(message);
}


class ApiException extends AppException {
  final int? statusCode;
  const ApiException([String message = 'Erro na API', this.statusCode]) : super(message);

  @override
  String toString() => 'ApiException (status: $statusCode): $message';
}

// Exceção para métodos não implementados
class NotImplementedException extends AppException {
  const NotImplementedException([String message = 'Método não implementado']) : super(message);
}
