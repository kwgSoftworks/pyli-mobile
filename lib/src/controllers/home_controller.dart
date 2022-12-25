import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt activeDrawerIndex = 0.obs;
}