import 'package:customerapp/src/screens/authentication/login_page.dart';
import 'package:customerapp/src/screens/authentication/register_page.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:get/get.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.primary_dark_max,
      body: Column(
        children: [
          ///headers
          SizedBox(height: 100),
          Hero(
            tag: Images.logo,
            child: Image.asset(
              Images.logo,
              height: 55,
              width: 225 ,
            ),
          ),
          SizedBox(height: 22),
          Text(
            'Welcome to Pyli Customer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 6
            ),
            child: Text(
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CColors.grey,
              ),
            ),
          ),
          Spacer(),

          ///buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CButton(
              onPressed: (){
                Get.to(()=>LoginPage());
              },
              label: 'Login to your account',
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
             child: CButton(
              onPressed: (){
                Get.to(()=>RegisterPage());
              },
              label: 'Create an account',
              color: CColors.primary_dark_max,
              border: BorderSide(
                color: CColors.primary,
                width: 2
              ),
            ),
          ),
          SizedBox(height: 32),


          ///footer
          Container(
            alignment: Alignment.topCenter,
            height: 92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6)
              ),
              color: Colors.white.withOpacity(.2)
            ),
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  CIcons.file_icon,
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 6),
                Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
