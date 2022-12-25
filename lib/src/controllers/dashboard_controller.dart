import 'package:customerapp/src/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController  extends GetxController{

  RxBool showTopError = RxBool(false);
  Rx<ContractStatus> contractStatus = ContractStatus.ACTIVE.obs;

  ScrollController scrollController =  ScrollController();
}