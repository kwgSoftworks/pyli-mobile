import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/models/enums.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(DashBoardController());

    return Obx(()=>ListView(
      controller: controller.scrollController,
      children: [

        if(controller.showTopError.value) Container(
          height: 62,
          width: double.infinity,
          color: CColors.red,
          padding: EdgeInsets.only(
            top: 12,
            left: 14,
            right: 14
          ),
          child: Text(
            'Quam duis lectus sed sit nam sit phasellus sed morbi. Et viverra arcu, nisi porttitor hendrerit urna.',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w400
            ),
          ),
        ),

        _ContractStatus(status: controller.contractStatus.value),

        Container(
          decoration: BoxDecoration(
            color: CColors.greyf9,
            borderRadius: BorderRadius.circular(20)
          ),
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// subscription
              CDivider(),
              SizedBox(height: 14),
              Text(
                'Subscription plan',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: CColors.primary
                ),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$225.12',
                    style: GoogleFonts.roboto(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: CColors.primary_dark
                    ),
                  ),
                  Text(
                    '/month',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CColors.black.withOpacity(.5),
                      height: 2
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                'For “8558 Green Rd.”',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: CColors.black.withOpacity(.4),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 46,
                width: Get.width * .4,
                child: CButton(
                  label: 'View Subscription',
                  borderCurve: 6,
                  labelSize: 14,
                ),
              ),
              SizedBox(height: 14),

              /// files
              CDivider(),
              SizedBox(height: 14),
              Text(
                'Files',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: CColors.primary
                ),
              ),
              SizedBox(height: 8),
              Text(
                '0 new files',
                style: GoogleFonts.roboto(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: CColors.primary_dark
                ),
              ),
              SizedBox(height: 4),
              Text(
                '0 total files',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: CColors.black.withOpacity(.4),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 46,
                width: Get.width * .4,
                child: CButton(
                  label: 'View All Files',
                  borderCurve: 6,
                  labelSize: 14,
                ),
              ),
              SizedBox(height: 14),

              ///business
              CDivider(),
              SizedBox(height: 14),
              Text(
                'Business',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: CColors.primary
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Joe\'s John Repair',
                style: GoogleFonts.roboto(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: CColors.primary_dark
                ),
              ),
              SizedBox(height: 4),
              Text(
                'deanna.curtis@example.com',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: CColors.black.withOpacity(.4),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 46,
                width: Get.width * .4,
                child: CButton(
                  label: 'Contact Us',
                  borderCurve: 6,
                  labelSize: 14,
                ),
              ),
              SizedBox(height: 14),
              CDivider(),
            ],
          ),
        ),

        _PastCharges()
      ],
    ));
  }
}

class _ContractStatus extends StatelessWidget {
  final ContractStatus status;
  const _ContractStatus({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String statusMessage;
    late String icon;
    switch(status){
      case ContractStatus.ACTIVE:
        icon = CIcons.contract_active;
        statusMessage = 'Active';
        break;
      case ContractStatus.HOLD:
        icon = CIcons.contract_hold;
        statusMessage = 'on hold for billing purposes';
        break;
      case ContractStatus.PROCESSING:
        icon = CIcons.contract_processing;
        statusMessage = 'processing for signatures and filing';
        break;
    }
    return Container(
      color: CColors.primary_dark_max,
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contract Status',
            style: GoogleFonts.roboto(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 4),
          RichText(
            text: TextSpan(
              text: 'You contract is ',
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white
              ),
              children: [TextSpan(
                text: statusMessage,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  color: CColors.primary
                )
              )]
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.05),
                  borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.all(12),
                child: Image.asset(
                  icon,
                ),
              ),
              SizedBox(width: 32),
              if(status == ContractStatus.ACTIVE) Expanded(
                child: CButton(
                  label: 'Download Contract',
                ),
              ),

              if(status == ContractStatus.PROCESSING) Expanded(
                child: CButton(
                  label: 'Sign Contract',
                ),
              ),
              if(status == ContractStatus.HOLD) Expanded(
                child: Column(
                  children: [
                    CButton(
                      label: 'Download Contract',
                    ),
                    SizedBox(height: 12),
                    CButton(
                      label: 'Renew Subscription',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_time_filled_rounded,
                color: Colors.white,
                size: 32,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Renewal Date',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CColors.primary.withOpacity( status == ContractStatus.ACTIVE ? 1 : .2)
                    ),
                  ),
                  Text(
                    '12/12/12',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity( status == ContractStatus.ACTIVE ? 1 : .2)
                    ),
                  ),
                ],
              ),
              SizedBox(width: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Frequency',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CColors.primary.withOpacity( status == ContractStatus.ACTIVE ? 1 : .2)
                    ),
                  ),
                  Text(
                    'Yearly',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity( status == ContractStatus.ACTIVE ? 1 : .2)
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _PastCharges extends StatefulWidget {
  const _PastCharges({Key? key}) : super(key: key);

  @override
  State<_PastCharges> createState() => _PastChargesState();
}

class _PastChargesState extends State<_PastCharges> {

  bool showAllCharges = false;
  final controller = Get.find<DashBoardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CColors.greyf9,
        borderRadius: BorderRadius.circular(20)
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Past Charges',
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: CColors.primary
                      ),
                    ),
                    Text(
                      'List of all invoices and previous transactions',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CColors.black.withOpacity(.4),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 46,
                  child: CButton(
                    onPressed: (){
                      setState((){
                        showAllCharges = !showAllCharges;
                      });
                      if(showAllCharges){
                        ///delayed because UI needs to re-calculate its size before it can scroll to the end
                        Future.delayed(Duration(milliseconds: 100),(){
                          controller.scrollController.animateTo(
                            controller.scrollController.position.maxScrollExtent * .9,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn
                          );
                        });
                      }
                    },
                    label: showAllCharges ? 'Hide All' : 'View All',
                    borderCurve: 6,
                    labelSize: 14,
                  ),
                ),
              ),
            ],
          ),
          if(showAllCharges) SizedBox(height: 20),
          if(showAllCharges) Wrap(
            children: PastChargeModel.demo.map((e) => _PastChargeCard(item: e)).toList(),
          ),
        ],
      ),
    );
  }
}

class _PastChargeCard extends StatelessWidget {
  final PastChargeModel item;
  const _PastChargeCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CColors.grey_light2,
        borderRadius: BorderRadius.circular(6)
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        bottom: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// title
          /// invoice
          Row(
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: CColors.primary
                      ),
                    ),
                    Text(
                      item.title,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CColors.black
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invoice Number',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: CColors.primary
                      ),
                    ),
                    Text(
                      '#${item.invoiceNumber}',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CColors.black
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

          SizedBox(height: 14),

          ///amount
          ///status
          Row(
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amount',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: CColors.primary
                      ),
                    ),
                    Text(
                      '\$${item.amount}',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CColors.black
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: CColors.primary
                      ),
                    ),
                    Text(
                      '#${item.invoiceNumber}',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CColors.black
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
