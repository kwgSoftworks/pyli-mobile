import 'package:customerapp/src/controllers/auth_controller.dart';
import 'package:customerapp/src/helpers/text_validators.dart';
import 'package:customerapp/src/models/enums.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/screens/authentication/login_page.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _controller = Get.find<AuthController>();

  @override
  void initState() {
    _controller.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Obx(()=>Column(
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
                        _controller.registerPageState.value == RegisterPageState.DONE ? 'You Are in the list!' : 'Create an account ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CColors.primary_dark_max
                        ),
                      ),
                      Text(
                        _controller.registerPageState.value == RegisterPageState.DONE ? 'You have been added to the list of pending users. you would be sent a mail to login once we complete your registration' : _controller.registerPageState.value == RegisterPageState.STEP1 ? 'Choose your account type below' : 'Fill the form below to continue ',
                        style: TextStyle(
                            color: CColors.grey_light
                        ),
                      ),
                      SizedBox(height: 4),
                      if(_controller.registerPageState.value != RegisterPageState.DONE) RichText(
                        text: TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                            fontSize: 14,
                            color: CColors.black
                          ),
                          children: [TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = (){
                              Get.off(() => LoginPage());
                            },
                            text: ' Login',
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

              if(_controller.registerPageState.value != RegisterPageState.DONE) SizedBox(height: 24),
              if(_controller.registerPageState.value != RegisterPageState.DONE) _StepCounter(state: _controller.registerPageState.value),
              if(_controller.registerPageState.value != RegisterPageState.DONE) SizedBox(height: 16),

              if(_controller.registerPageState.value != RegisterPageState.DONE) Text(
                _controller.registerPageState.value == RegisterPageState.STEP1 ?
                'Account Type'
                : _controller.registerPageState.value == RegisterPageState.STEP2 ?
                'Personal Details'
                :
                'Other Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: CColors.grey_light
                ),
              ),
              if(_controller.registerPageState.value == RegisterPageState.STEP3)Padding(
                padding: const EdgeInsets.only(
                  top: 4
                ),
                child: Text(
                  'These fields are optional, but please fill in as many as you can',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: CColors.grey_light
                  ),
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if(_controller.registerPageState.value == RegisterPageState.STEP1) _Step1(controller: _controller),
                      if(_controller.registerPageState.value == RegisterPageState.STEP2) _Step2(controller: _controller),
                      if(_controller.registerPageState.value == RegisterPageState.STEP3) _Step3(controller: _controller),
                      if(_controller.registerPageState.value == RegisterPageState.DONE) _StepDone(),

                      Padding(
                        padding: EdgeInsets.only(
                            top: 24
                        ),
                        child: CButton(
                          onPressed: () async{
                            switch(_controller.registerPageState.value){
                              case RegisterPageState.STEP1:
                                _controller.registerPageState.value = RegisterPageState.STEP2;
                                break;
                              case RegisterPageState.STEP2:
                                if(_controller.formKey.currentState!.validate()){
                                  _controller.registerPageState.value = RegisterPageState.STEP3;
                                }
                                break;
                              case RegisterPageState.STEP3:
                                final error = await _controller.register();
                                if(error){

                                }else{
                                  _controller.registerPageState.value = RegisterPageState.DONE;
                                }
                                break;
                              case RegisterPageState.DONE:
                                Get.off(()=>LoginPage());
                                break;
                            }
                          },
                          loading: _controller.loading.value,
                          label: _controller.registerPageState.value == RegisterPageState.DONE ? 'GO TO LOGIN' : 'CONTINUE',
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

class _StepCounter extends StatelessWidget {
  final RegisterPageState state;
  const _StepCounter({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String image;
    switch(state){
      case RegisterPageState.STEP1:
        image = Images.reg_step1;
        break;
      case RegisterPageState.STEP2:
        image = Images.reg_step2;
        break;
      case RegisterPageState.STEP3:
        image = Images.reg_step3;
        break;
      case RegisterPageState.DONE:
        image = 'none';
        break;
    }
    return Image.asset(
      image
    );
  }
}

class _Step1 extends StatelessWidget {
  final AuthController controller;
  const _Step1({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      final bool isMethod1 = controller.accType.value == 'residental';
      return Column(
        children: [
          _Step1Sub(
            onTap: (){
              controller.accType.value = 'residental';
            },
            image: Images.reg_home,
            title: 'Residental',
            subtitle: 'For your homes and residental properties',
            isActive: isMethod1,
          ),
          SizedBox(height: 32),
          _Step1Sub(
            onTap: (){
              controller.accType.value = 'commercial';
            },
            image: Images.reg_shop,
            title: 'Commercial',
            subtitle: 'For your shops and businesses',
            isActive: !isMethod1,
          )
        ],
      );
    });
  }
}

class _Step1Sub extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final String image;
  final String title;
  final String subtitle;
  const _Step1Sub({Key? key, required this.isActive, required this.image, required this.title, required this.subtitle, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: isActive ? CColors.primary : CColors.grey_light2,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Image.asset(
                image,
                color: isActive ? Colors.white : CColors.primary,
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: isActive ? CColors.primary : CColors.black
                ),
              ),
              SizedBox(width: 8),
              if(isActive) Icon(
                Icons.check_circle,
                color: CColors.primary,
                size: 22,
              ),
            ],
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: CColors.grey_light
            ),
          )
        ],
      ),
    );
  }
}


class _Step2 extends StatelessWidget {
  final AuthController controller;
  const _Step2({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CTextField(
            controller: controller.emailController,
            header: 'Email',
            validator: TextValidators.email,
          ),
          SizedBox(height: 14),
          CTextField(
            controller: controller.firstNameController,
            header: 'First Name',
            validator: TextValidators.name,
          ),
          SizedBox(height: 14),
          CTextField(
            controller: controller.lastNameController,
            header: 'Last Name',
            validator: TextValidators.name,
          ),
          SizedBox(height: 14),
          CTextField(
            controller: controller.phoneController,
            header: 'Phone Number',
            textInputFormatter: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: TextValidators.phone,
          ),
          SizedBox(height: 14),
          CTextField(
            controller: controller.pass1Controller,
            header: 'Password',
            validator: TextValidators.password,
            isPassword: true,
          ),
          SizedBox(height: 14),
          CTextField(
            controller: controller.pass2Controller,
            header: 'Re-Enter password',
            isPassword: true,
            validator: (pass){
              if(controller.pass1Controller.text == pass){
                return null;
              }else{
                return 'Passwords do not match';
              }
            },
          )
        ],
      ),
    );
  }
}

class _Step3 extends StatelessWidget {
  final AuthController controller;
  const _Step3({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CTextField(
          controller: controller.siteNumberController,
          header: 'Site Number',
        ),
        SizedBox(height: 14),
        CTextField(
          controller: controller.permitNumberController,
          header: 'Permit Number',
        ),
        SizedBox(height: 14),
        CTextField(
          controller: controller.agencyController,
          header: 'Agency',
        ),
        SizedBox(height: 14),
        CTextField(
          controller: controller.brandController,
          header: 'Brand',
        ),
        SizedBox(height: 14),
        CTextField(
          controller: controller.manufactureController,
          header: 'Manufacturer (Safety Tank manufacturer)',
        ),
        SizedBox(height: 14),
        CTextField(
          controller: controller.idNumberController,
          header: 'ID Number',
        )
      ],
    );
  }
}

class _StepDone extends StatelessWidget {
  const _StepDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
