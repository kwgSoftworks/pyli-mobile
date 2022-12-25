import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/helpers/local_storage.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/screens/home/home_page.dart';
import 'package:customerapp/src/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key){
    Get.put(AuthController());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pyli Customer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: CColors.primary,
          titleSpacing: 0,
          titleTextStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 20
          )
        ),
      ),
      home: const HomePage(),
    );
  }
}