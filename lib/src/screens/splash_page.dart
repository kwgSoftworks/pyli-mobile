import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/screens/authentication/authentication_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  bool alreadyLoggedIn = false;

  @override
  void initState() {
    super.initState();
    if(alreadyLoggedIn){
      Future.delayed(Duration(milliseconds: 1000),(){

      });
    }else{
      Future.delayed(Duration(milliseconds: 1000),(){
        Get.offAll(()=>AuthPage());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.primary_dark_max,
      body: Center(
        child: Hero(
          tag: Images.logo,
          child: Image.asset(
            Images.logo,
            height: 55,
            width: 225 ,
          ),
        ),
      )
    );
  }
}
