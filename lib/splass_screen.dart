import 'package:flutter/material.dart';

class SplassScreen extends StatelessWidget {
  const SplassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: const Center(
          child: Text("Welcome to App",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}