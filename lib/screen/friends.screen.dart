import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/friends.bloc.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => UserEvent(),
      child: const UserList(),
    ));
  }
}

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserEvent>().fetchData();

    return BlocBuilder<UserEvent, List<User>>(
      builder: (context, userList) {
        return userList.isEmpty
            ? const Center(
                child: Text("Danh sách người dùng trống"),
              )
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return ListTile(
                    title: Text(user.username),
                  );
                },
              );
      },
    );
  }
}
