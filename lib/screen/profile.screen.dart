import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
        child: Column(
          children: [
            Container(
              child: Center(
                child:  Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.blue
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Quốc Con", style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              )
            ),
            Container(
              width: double.infinity,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("dyguasdgyu")
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
