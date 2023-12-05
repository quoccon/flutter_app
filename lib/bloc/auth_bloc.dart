// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});
}

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class AuthCubit extends Cubit<AuthState> {
  final Dio dio = Dio();

  AuthCubit() : super(AuthInitial());

  void login(String username, String password) async {
    print('user ==   ${username.isEmpty}');
    print('password ==   ${password.isEmpty}');

    if (username.isEmpty || password.isEmpty) {
      emit(AuthError(errorMessage: "Vui lòng nhập đầy đủ thông tin!"));
      return;
    }
    emit(AuthLoading());

    try {
      // Gọi API
      final response = await dio.post(
        'http://localhost:8000/login-api',
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthError(errorMessage: "Tên người dùng hoặc mật khẩu không hợp lệ"));
      }
    } catch (e) {
      emit(AuthError(errorMessage: "Đã xảy ra lỗi khi xử lý yêu cầu của bạn"));
    }
  }


  void register(String usernameController, String passwordController, String confirmPassword) async {
    final username =  usernameController;
    final password = passwordController;

    if(username.isEmpty || password.isEmpty || confirmPassword.isEmpty ) {
      emit(AuthError(errorMessage: "Vui lòng nhập đầy đủ thông tin"));
      return;
    }
    if(password != confirmPassword){
      emit(AuthError(errorMessage: "Mật khẩu không trùng khớp"));
    }
    emit(AuthLoading());

    try {
      final response = await dio.post(
        'http://localhost:8000/reg-api',
        data: {'username':username, 'password':password, 'confirmpassword':confirmPassword}
      );

      if(response.statusCode == 200){
        emit(AuthAuthenticated());
        print('user ==  ${username.isEmpty}');
         print('pass ==  ${password.isEmpty}');
      }else{
        emit(AuthError(errorMessage: "Tài khoản đã tồn tại"));
      }
    } catch (e) {
      emit(AuthError(errorMessage: "Đã có lỗi khi xử lí yêu cầu của bạn"));
    }
  }
}
