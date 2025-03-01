import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dev_test/core/api/api_client.dart';
import 'package:flutter_dev_test/core/api/exceptions.dart';
import 'package:http/http.dart' as http;

class ApiResponseService {
  ApiResponse fromHttpResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      dynamic data = {'responses': []};

      if (response.body.isNotEmpty) {
        try {
          dynamic decodedData = jsonDecode(response.body);

          if (decodedData is List) {
            data = {'responses': decodedData};
          } else if (decodedData is Map) {
            data = decodedData;
          } else if (decodedData is String || decodedData is num) {
            data = {'response': decodedData};
          } else {
            data = {'error': 'Invalid JSON format'};
          }
        } catch (e) {
          data = {'error': 'Invalid JSON format'};
        }
      }

      return ApiResponse(
        data: data,
        status: response.statusCode,
      );
    }

    throw errorHandler(response);
  }

  ApiException errorHandler(http.Response error) {
    String? message;
    if (error.body.isNotEmpty) {
      try {
        message = jsonDecode(error.body) ?? 'Erro desconhecido';
      } catch (e) {
        message = 'Erro desconhecido';
      }
    }

    if (kDebugMode) print(message);

    if (error.statusCode >= 500) {
      return ServerException(error);
    }
    if (error.statusCode == 404) {
      return NotFoundException(error);
    }
    if (error.statusCode == 400) {
      return BadRequestException(error);
    }
    if (error.statusCode == 401) {
      if (message == 'Invalid credentials') {
        message = 'Credenciais inválidas';
      } else if (message == 'Invalid TOTP code' ||
          message == 'Invalid recovery code') {
        message = 'Código inválido';
      } else if (message == 'Invalid password') {
        message = 'Senha incorreta';
      }
      return UnauthorizedException(error, message: message);
    }

    return ApiException(error, message: message ?? 'Algo deu errado');
  }
}
