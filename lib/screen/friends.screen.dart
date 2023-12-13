import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/friends.bloc.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => UserCubit(),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchBar(),
          ),
          Expanded(
            child: UserList(),
          )
        ],
      ),
    ));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query){
        context.read<UserCubit>().searchU(query);
      },
      decoration: InputDecoration(
        hintText: "Search here...",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        )
      ),
    );
  }
}


class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().fetchData();

    return BlocBuilder<UserCubit  , List<User>>(
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
