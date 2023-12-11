import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/chat_cubut.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String receiveId;

  const HomeScreen({super.key, required this.receiveId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageCubit(),
    );
  }
}
