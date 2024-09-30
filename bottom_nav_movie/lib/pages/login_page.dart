import 'package:bottom_nav_movie/widget/mybutton.dart';
import 'package:bottom_nav_movie/widget/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: asikkcolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/icon/mmm.jpg'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "MOVIES APP",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: primaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Mybutton(
              foregroundColor: dahscolor,
              backgroundColor: butcolor,
              text: "MASUK",
              onPressed: () {
                Get.toNamed('/dashboard');
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
