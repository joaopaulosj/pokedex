import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/constants/app_strings.dart';

class Failure extends Equatable {
  final dynamic exception;
  final dynamic data;

  const Failure({required this.exception, this.data});

  @override
  List<Object?> get props => [exception, data];

  String getMessage() {
    final error = exception;

    try {
      if (exception is DioError) {
        return error.message;
      } else {
        return AppStrings.unknownError;
      }
    } catch (ex) {
      return AppStrings.unknownError;
    }
  }
}
