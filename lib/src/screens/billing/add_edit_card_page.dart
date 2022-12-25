import 'package:csc_picker/csc_picker.dart';
import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingAddEditCardPage extends StatelessWidget {
  final CreditCardModel? card;
  const BillingAddEditCardPage({Key? key, this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<BillingController>();

    final editMode = card != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${editMode ? 'Edit' : 'Add'} Card'
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CTextField(
                header: "Card Number",
                hintText: '1234 1234 1234 1234',
              ),
              SizedBox(height: 12),
              CTextField(
                header: "Expiry Date",
                hintText: 'MM/YY',
              ),
              SizedBox(height: 12),
              CTextField(
                header: "CVV",
                hintText: '3-digit number',
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 4
                ),
                child: Text(
                  'Country',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff222222)
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.only(
                  top: 8
                ),
                child: CSCPicker(
                  onCountryChanged: controller.selectedCountry,
                  onStateChanged: (_){},
                  onCityChanged: (_){},
                  showStates: false,
                  showCities: false,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xfff5f5f5)
                  ),
                  selectedItemStyle: GoogleFonts.roboto(
                    fontSize: 16,
                    color: CColors.black
                  ),
                ),
              ),
              SizedBox(height: 12),
              CTextField(
                hintText: 'Zip Code',
              )
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          bottom: 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CButton(
              label: 'CONTINUE',
              icon: Icons.lock,
            ),
            SizedBox(height: 12),
            CButton(
              label: 'Cancel',
              color: Colors.white,
              labelColor: CColors.primary,
              border: BorderSide(
                width: 2,
                color: CColors.primary
              ),
            ),
          ],
        ),
      ),
    );
  }
}
