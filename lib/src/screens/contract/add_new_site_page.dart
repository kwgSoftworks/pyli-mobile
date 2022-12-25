import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class AddNewSitePage extends StatelessWidget {
  const AddNewSitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Site'
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: [

            CTextField(
              header: 'Site Address',
            ),
            SizedBox(height: 14),
            CTextField(
              header: 'Agency',
            ),
            SizedBox(height: 14),
            CTextField(
              header: 'Manufacturer',
            ),
            SizedBox(height: 14),
            CTextField(
              header: 'ID Number',
            ),
            SizedBox(height: 14),
            CTextField(
              header: 'Permit Number',
            ),
            SizedBox(height: 20),
            CButton(
              label: 'PROCEED TO PLAN',
            ),
            SizedBox(height: 14),
            CButton(
              label: 'CANCEL',
              labelColor: CColors.primary,
              color: Colors.white,
              border: BorderSide(
                width: 2,
                color: CColors.primary
              ),
            )
          ],
        ),
      ),
    );
  }
}
