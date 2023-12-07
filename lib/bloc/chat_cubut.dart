import 'package:bloc/bloc.dart';

abstract class ChatEvent {}

class SendMessEvent extends ChatEvent{
  final String message;
  final String receiverId;

  SendMessEvent({required this.message, required this.receiverId});
}

class ChatState{}

class ChatLoadState extends ChatState{
    final List<String> message;

    ChatLoadState({required this.message});
}

class ChatError extends ChatState{
  final String error;
  ChatError({required this.error});
}

class ChatCubit extends Cubit<ChatState>{
  ChatCubit() : super(ChatLoadState(message: []));


  void sendMessage(String message, String receiverId){
    List<String> updateMessage = (state as ChatLoadState).message;
    updateMessage.add(message);
    emit(ChatLoadState(message: updateMessage));
  }
}