import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class MessageEvent {}

class SendMessEvent extends MessageEvent {
  final String receiverId;
  final String message;

  SendMessEvent({required this.receiverId, required this.message});
}

abstract class MessState {}

class MessInitialState extends MessState {}

class MessLoadingState extends MessState {}

class MessSuccessState extends MessState {
  final dynamic data;

  MessSuccessState({required this.data});
}

class MessError extends MessState {
  final String error;

  MessError({required this.error});
}

class MessageCubit extends Cubit<MessState> {
  final Dio dio = Dio();

  MessageCubit() : super(MessInitialState());

  Future<void> sendMess({required String receiverId, required String message}) async {
    try {
      emit(MessLoadingState()); //
      final response = await dio.post(
        "http://localhost:8000/api-postmessage",
        data: {'receiverId': receiverId, 'message': message},
      );

      final data = response.data;
      emit(MessSuccessState(data: data));
    } catch (e) {
      print("Error: $e");
      emit(MessError(error: "Error sending message"));
    }
  }
}
