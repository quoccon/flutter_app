import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class GetUserEvent {}


class UserState {
  final bool loading;
  final dynamic data;
  final String error;

  UserState({required this.loading, this.data, this.error = ''});
}

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(loading: false));

  // Hàm thực hiện việc lấy thông tin người dùng
  Future<void> getUserInfo() async {
    emit(UserState(loading: true));

    try {
      final response = await Dio().get('http://10.0.2.2:8000/getUInfo');
      emit(UserState(loading: false, data: response.data));
    } catch (error) {
      emit(UserState(loading: false, error: 'Failed to fetch user info'));
    }
  }
}
