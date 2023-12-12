import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class User{
  final String username;
  final String password;

  User({required this.username, required this.password});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] ?? "",
      password: json['password'] ?? "",
    );
  }
}


class UserEvent extends Cubit<List<User>>{
  UserEvent() : super([]);

  Future<void> fetchData() async{
    print('0');
    final dio = Dio();
    print('1');
    final response = await dio.get('htt8000/gep://localhost:tAllU');
    print('2');
    print(response.data);
    emit(List<User>.from(response.data.map((user) => User.fromJson(user))));
  }
}