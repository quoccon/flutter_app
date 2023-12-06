import 'package:flutter/material.dart';
import 'package:flutter_app/screen/users/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: const RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool showError = false;
  bool isReg =false;
  bool isLoading = false;
  late AuthCubit authCubit;
  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My App",
              style: TextStyle(
                  fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Register for My App",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
            ),
            Visibility(
              visible: showError &&
                  (usernameController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      confirmPasswordController.text.isEmpty),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  (authCubit.state is AuthError)
                      ? (authCubit.state as AuthError).errorMessage
                      : "",
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  print('1');
                  setState(() {
                    showError = true;
                  });
                  // Call the register method from AuthCubit
                  authCubit.register(
                    usernameController.text,
                    passwordController.text,
                    confirmPasswordController.text,
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>const LoginPage(),
                          )
                      );
                    },

                  );

                },
                fillColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate back to the login screen
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },);
  }
}
