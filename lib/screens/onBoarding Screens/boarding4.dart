import 'package:flutter/material.dart';

class Boarding4 extends StatelessWidget {
  const Boarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 150),

              //! العنوان
              Text(
                "Let's set you up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              //! تحميل الصورة
            ],
          ),
        ),
      ),
    );
  }
}
