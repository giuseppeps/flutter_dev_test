import 'package:dartz/dartz.dart';
import 'package:flutter_dev_test/core/api/exceptions.dart';

abstract class BaseService {
  Future<Either<String, T>> call<T>(
    Future<T> Function() repositoryCall,
  ) async {
    try {
      final response = await repositoryCall();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'Erro desconhecido');
    } catch (e) {
      return left('Erro desconhecido: ${e.toString()}');
    }
  }
}
