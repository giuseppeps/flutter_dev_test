import 'package:dartz/dartz.dart';

abstract class BaseService {
  Future<Either<Exception, T>> call<T>(
    Future<T> Function() repositoryCall,
  ) async {
    try {
      final response = await repositoryCall();
      return right(response);
    } catch (e) {
      return left(Exception('Erro desconhecido: ${e.toString()}'));
    }
  }
}
