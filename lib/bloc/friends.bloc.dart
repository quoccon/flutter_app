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


class UserCubit extends Cubit<List<User>>{
  UserCubit() : super([]);

  Future<void> fetchData() async{
    final dio = Dio();
    final response = await dio.get('http://10.0.2.2:8000/getAllU');
    print(response.data);
    emit(List<User>.from(response.data.map((user) => User.fromJson(user))));
  }

  Future<void> searchU(String name) async {
   try{
     print('1');
      final Dio dio = Dio();
     final response = await dio.get('http://10.0.2.2:8000/searchU',data: {'name':name},);
     print('2');
      if(response.statusCode == 200) {
       emit(List<User>.from(response.data.map((user) => User.fromJson(user))));
       print('3');
      }else{
       print('Không tìm thấy người dùng');
       emit([]);
       print('4');
      }
   }catch(e){
     print('Lỗi khi kết nối tối api $e');
     emit([]);
    }
  }
}