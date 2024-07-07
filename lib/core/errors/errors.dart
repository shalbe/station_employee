import 'package:flutter/foundation.dart';

class ErrorModel {
  final String error;
  // final String status;

  ErrorModel({
    required this.error,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(error: json['message']);
  }
}
