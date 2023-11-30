import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: const LoginFrom(),
      ),
    );
  }
}

class LoginFrom extends StatefulWidget {
  const LoginFrom({super.key});

  @override
  State<LoginFrom> createState() => _LoginFromState();
}

class _LoginFromState extends State<LoginFrom> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
            decoration:const InputDecoration(labelText: "Username"),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: passwordController,
            decoration:const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          const SizedBox(
            height: 10.0,
          ),

          ElevatedButton(
            onPressed: (){
              BlocProvider.of<AuthBloc>(context).add(
                LoginEvent(
                  username: usernameController.text,
                  password: passwordController.text
                ),
              );
            },
            child:const Text("Login"),
          )
        ],
      ),
    );
  }
}