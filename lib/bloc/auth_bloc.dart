import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthError extends AuthState {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Dio dio = Dio();

  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthLoading();
      try {
        // Gọi API
        final response = await dio.post(
          'http://localhost:8000/login-api',
          data: {'username': event.username, 'password': event.password},
        );

        // Kiểm tra xem API có trả về thành công không
        if (response.statusCode == 200) {
          yield AuthAuthenticated();
        } else {
          yield AuthError();
        }
      } catch (e) {
        yield AuthError();
      }
    }
  }
}
