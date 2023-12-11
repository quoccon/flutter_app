import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> sendMessage(String message, String receiverId){
    return dio.post(
      "http://localhost:8000/api-postmessage",
      data: {'message':message, 'receiverId': receiverId},
    );
  }
}