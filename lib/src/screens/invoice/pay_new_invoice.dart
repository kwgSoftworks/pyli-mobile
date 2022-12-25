import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PayNewInvoicePage extends StatelessWidget {
  const PayNewInvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<InvoiceController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pay New Invoice'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Obx((){
          print(controller.selectedCard.value);
          return ListView(
            children: [
              CTextField(
                header: 'Invoice Amount',
                hintText: 'Amount',
                textInputFormatter: [
                  FilteringTextInputFormatter.deny(' ', replacementString: ''),
                  FilteringTextInputFormatter.deny(',', replacementString: ''),
                  FilteringTextInputFormatter.deny('-', replacementString: ''),
                ],
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 14),
              CTextField(
                header: 'Invoice Description',
                hintText: 'Description',
              ),
              SizedBox(height: 22),

              /// Payment Summary
              Text(
                'Payment Summary',
                style: GoogleFonts.roboto(
                    color: CColors.primary_dark,
                    fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 12),
              /// amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Invoice Amount',
                    style: GoogleFonts.roboto(
                        color: CColors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                    ),
                  ),
                  Text(
                    '\$123.23',
                    style: GoogleFonts.roboto(
                      color: CColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              /// tax
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tax',
                    style: GoogleFonts.roboto(
                        color: CColors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                    ),
                  ),
                  Text(
                    '\$12.45',
                    style: GoogleFonts.roboto(
                      color: CColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              CDivider(),
              SizedBox(height: 12),
              /// total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Recurring Fee',
                    style: GoogleFonts.roboto(
                        color: CColors.primary_dark_max,
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                    ),
                  ),
                  Text(
                    '\$136.78',
                    style: GoogleFonts.roboto(
                      color: CColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),


              SizedBox(height: 32),
              SizedBox(
                height: 158,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: CreditCardModel.demo.map((card) => CreditCardWidget(
                    card: card,
                    active: controller.selectedCard.value == card,
                    isOdd: CreditCardModel.demo.indexOf(card).isOdd,
                    onTap: (){
                      controller.selectedCard(card);
                    }
                  )).toList(),
                ),
              ),
            ],
          );
        })
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          bottom: 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CButton(
              label: 'PAY & CONTINUE',
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