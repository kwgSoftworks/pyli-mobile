import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password'
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(14),
        children: [
          CTextField(
            header: 'Current Password',
            isPassword: true,
          ),
          SizedBox(height: 14),
          CTextField(
            header: 'New Password',
            isPassword: true,
          ),
          SizedBox(height: 14),
          CTextField(
            header: 'Re-Enter Password',
            isPassword: true, 
          ),
          SizedBox(height: 32),

          CButton(
            label: 'Save',
          ),
          SizedBox(height: 14),
          CButton(
            label: 'Cancel',
            color: Colors.white,
            labelColor: CColors.primary,
            border: BorderSide(
              color: CColors.primary,
              width: 2
            ),
          )
        ],
      ),
    );
  }
}
