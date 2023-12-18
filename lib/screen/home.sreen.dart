import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/chat_cubut.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
      ),

    );
  }
}

// class ChatBody extends StatelessWidget {
//   final TextEditingController messageControl = TextEditingController();
//
//   const ChatBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//
//       ],
//     );
//   }
// }





