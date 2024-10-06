import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Boarding1 extends StatelessWidget {
  const Boarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // الصورة
          Lottie.asset("code/assets/images/animation1.json",
              width: 300, height: 300),
          // العنوان
        ],
      ),
    );
  }
}
