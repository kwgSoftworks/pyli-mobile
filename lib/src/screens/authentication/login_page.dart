import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/screens/authentication/forgot_password_page.dart';
import 'package:customerapp/src/screens/authentication/register_page.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height * .9,
              child: Column(
                children: [

                  Align(
                    alignment: Alignment.topLeft,
                    child: CBackButton(
                      onTap: (){
                        Get.back();
                      }
                    )
                  ),
                  SizedBox(height: 12),

                  /// top text
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: CColors.primary_dark_max
                            ),
                          ),
                          Text(
                            'Please Log into your account',
                            style: TextStyle(
                                 color: CColors.grey_light
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),

                  ///text fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      children: [
                        CTextField(
                          header: 'Business URL',
                        ),
                        SizedBox(height: 16),
                        CTextField(
                          header: 'Email',
                        ),
                        SizedBox(height: 16),
                        CTextField(
                          header: 'Password',
                          isPassword: true,
                        ),
                        Align(
                          alignment: Alignment.topRight ,
                          child: TextButton(
                            onPressed: (){
                              Get.to(()=>ForgotPasswordPage());
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: CColors.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            )
                          ),
                        ),
                        SizedBox(height: 14),
                        CButton(
                          onPressed: (){

                          },
                          label: 'LOGIN',
                        )
                      ],
                    ),
                  ),

                  Spacer(),

                  RichText(
                    text: TextSpan(
                      text: 'You do not have an account?',
                      style: TextStyle(
                        fontSize: 16,
                        color: CColors.black
                      ),
                      children: [TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Get.off(() => RegisterPage());
                        },
                        text: ' Sign Up',
                        style: TextStyle(
                          color: CColors.primary,
                          fontWeight: FontWeight.bold
                        )
                      )]
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
