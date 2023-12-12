import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/chat_cubut.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String receiveId;

  const HomeScreen({super.key, required this.receiveId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageCubit(),
      child: BlocConsumer<MessageCubit,MessState>(
        listener: (context,state){
          if(state is MessSuccessState){

          }else if(state is MessError){

          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text("Chat with $receiveId"),
            ),
            // body: Column(
            //   children: [
            //     Expanded(
            //       child: MessList(),
            //     )
            //     Mes
            //   ],
            // ),
          );
        },
      ),
    );
  }
}


// class MessList extends StatelessWidget {
//   const MessList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MessageCubit, MessState>(
//       builder: (context, state) {
//         if (state is MessSuccessState) {
//           final messages = state.data['messages'];
//           return ListView.builder(
//             itemCount: messages.length,
//             reverse: true,
//             itemBuilder: (context, index) {
//               final message = messages[index];
//               return MessageWidget(message: message);
//             },
//           );
//         } else {
//
//           return Container();
//         }
//       },
//     );
//   }
// }



// class MessageWidget extends StatelessWidget {
//   final Map<String , dynamic> message;
//   const MessageWidget({super.key, required this.message});
//
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isCurrent = message['senderId'] == curentUser;
//     return Align(
//       alignment: isCurrent ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//
//       ),
//
//     )
//   }
// }


