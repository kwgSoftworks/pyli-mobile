import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile'
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: [

            CTextField(
              header: 'First Name',
            ),
            SizedBox(height: 14),
            CTextField(
              header: 'Last Name',
            ),
            SizedBox(height: 14),
            CTextField(
              header: 'Email',
            ),
            SizedBox(height: 14),
            CTextField(
              header: 'Phone Number',
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
      ),
    );
  }
}
