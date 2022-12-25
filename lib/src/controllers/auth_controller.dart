import 'package:customerapp/src/models/enums.dart';
import 'package:customerapp/src/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  final AuthRepo _repo = AuthRepo();

  Rx<RegisterPageState> registerPageState = RegisterPageState.STEP1.obs;
  RxString accType = 'residental'.obs;
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();

  TextEditingController siteNumberController = TextEditingController();
  TextEditingController permitNumberController = TextEditingController();
  TextEditingController agencyController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController manufactureController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();

  RxBool loading = RxBool(false);

  Future<bool> login() async{
    return false;
  }

  Future<bool> register() async{
    loading(true);

    final res = await _repo.register(
      accType: accType.value,
      email: emailController.text,
      fName: firstNameController.text,
      lName: lastNameController.text,
      phone: phoneController.text,
      password: pass1Controller.text,
      agency: null,
      brand: brandController.text,
      manufacture: manufactureController.text,
      idNumber: idNumberController.text,
      permitNumber: permitNumberController.text,
      siteNumber: siteNumberController.text
    );

    loading(false);
    return res.error;
  }


  void reset(){
    loading(false);
    accType('residental');
    registerPageState.value = RegisterPageState.STEP1;
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    pass1Controller.clear();
    pass2Controller.clear();
    siteNumberController.clear();
    permitNumberController.clear();
    agencyController.clear();
    brandController.clear();
    manufactureController.clear();
    idNumberController.clear();
  }
}