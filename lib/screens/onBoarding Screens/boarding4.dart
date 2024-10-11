import 'package:flutter/material.dart';

class Boarding4 extends StatelessWidget {
  Boarding4({super.key});

  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120),

                // العنوان
                Text(
                  "Let's set you up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                // تحميل الصورة
                Text(
                  "Upload profile picture",
                  style: TextStyle(fontSize: 24),
                ),

                SizedBox(height: 20),

                Center(
                  child: Stack(clipBehavior: Clip.none, children: [
                  //الصورة
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/person.png'),
                    ),

                    // ايقونة التحميل
                    Positioned(
                      left: 80,
                      top: 120,
                      child: MaterialButton(
                        padding: EdgeInsets.all(12),
                        color: Theme.of(context).colorScheme.primary,
                        shape: CircleBorder(),
                        onPressed: () {},
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ]),
                ),

                SizedBox(height: 25),

                // اسم المستخدم
                Text(
                  "Username",
                  style: TextStyle(fontSize: 24),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
