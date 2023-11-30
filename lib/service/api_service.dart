import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> login(String username, String password) async{
    try {
      return await dio.post(
        'http://localhost:8000/login-api',
        data: {'username':username, 'password':password},
      );
    } catch (e) {
      rethrow;
    }
  }
}