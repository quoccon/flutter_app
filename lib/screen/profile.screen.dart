import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/frofile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserCubit(),
        child: ProfileBody(),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("sabhsv"),
    );
  }
}

Widget buildProfileItem(String title, IconData icon, VoidCallback onTap){
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
    );
}

