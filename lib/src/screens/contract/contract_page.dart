import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_new_site_page.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ContractController.get;
    return Container(
      padding: EdgeInsets.fromLTRB(14, 14, 14, 0),
      child: Obx(()=>Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CButton(
                  onPressed: () => Get.to(()=>AddNewSitePage()),
                  color: CColors.primary_light,
                  labelColor: CColors.primary,
                  labelSize: 14,
                  label: 'Add New Site',
                  icon: Icons.add,
                  iconColor: CColors.primary,
                )
              ),
              SizedBox(width: 20),
              Expanded(child: SizedBox())
            ],
          ),
          SizedBox(height: 14),

          Container(
            decoration: BoxDecoration(
              color: CColors.greyf6,
              borderRadius: BorderRadius.circular(4)
            ),
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                onChanged: controller.selectedSite,
                value: controller.selectedSite.value,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: CColors.black
                ),
                isExpanded: true,
                dropdownColor: CColors.greyf6,
                focusColor: CColors.greyf6,
                borderRadius: BorderRadius.circular(8),
                items: controller.sites.map((site) => DropdownMenuItem(
                  value: site,
                  child: Text(
                    site
                  ),
                )).toList(),
              ),
            ),
          ),

          SizedBox(height: 14),
          _ContractInfo(
            pendingCancel: controller.selectedSite.value == 'Site 2 - 8765 Blue RD'
          )
        ],
      )),
    );
  }
}

class _ContractInfo extends StatelessWidget {
  final bool pendingCancel;
  const _ContractInfo({Key? key, this.pendingCancel = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: CColors.greyf9
            ),
            padding: EdgeInsets.fromLTRB(14, 14, 14, 0),
            child: ListView(
              children: [
                Text(
                  'Basic Plan',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CColors.green
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$120',
                      style: GoogleFonts.roboto(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: CColors.primary_dark
                      ),
                    ),
                    Text(
                      '/year',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: CColors.primary_dark,
                        height: 3.3
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),

                InfoWidget(
                  title: 'Frequency',
                  subtitle: 'Yearly'
                ),
                InfoWidget(
                  title: 'Auto-Renewal',
                  subtitle: 'Yes'
                ),
                InfoWidget(
                  title: 'Start Date',
                  subtitle: '01/02/2021'
                ),
                InfoWidget(
                  title: 'Next Billing Date',
                  subtitle: '01/02/2022'
                ),
                InfoWidget(
                  title: 'Adjustments',
                  subtitle: '\$45'
                ),
                InfoWidget(
                  title: 'Plan Description',
                  subtitle: 'Amet, ac sit fames elit eu, lobortis purus. Pellentesque orci egestas sed aliquet.'
                ),

                SizedBox(height: 12),
                Text(
                  'Add-Ons',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: CColors.primary
                  ),
                ),
                SizedBox(height: 12),

                Wrap(
                  children: [1,2,3].map((addon) => _AddOns(title: addon.toString())).toList(),
                ),
                SizedBox(height: 32),
                CButton(
                  label: 'DOWNLOAD CONTRACT',
                ),
                SizedBox(height: 14),
                CButton(
                  label: 'REQUEST CANCELLATION',
                  color: CColors.red_bright,
                ),
                SizedBox(height: 14),
              ],
            ),
          ),
          if(pendingCancel) Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: CColors.black.withOpacity(.85)
            ),
          ),
          if(pendingCancel) Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Pending Cancellation Request',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _AddOns extends StatelessWidget {
  final String title;
  const _AddOns({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: CColors.black,
          ),
          SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LQC Re-fill Service',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: CColors.black,
                    fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Amet, ac sit fames elit eu, lobortis purus. Pellentesque orci egestas sed aliquet.',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: CColors.black,
                    fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '\$120',
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    color: CColors.primary_dark,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
