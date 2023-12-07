import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> sendMessage(String message, String receiverId){
    return dio.post(
      "",data: {'message':message, 'receiverId': receiverId},
    );
  }
}