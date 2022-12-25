import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pay_new_invoice.dart';

class InvoiceListPage extends StatelessWidget {
  const InvoiceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InvoiceController());
    return Obx((){
      final allInvoices = controller.filteredInvoiceList.isEmpty ? controller.allInvoice : controller.filteredInvoiceList;
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            60
          ),
          child: Container(
            color: CColors.primary,
            padding: EdgeInsets.only(
              left: 14,
              right: 14,
              bottom: 12,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(111),
                color: CColors.primary_light2
              ),
              child: Stack(
                children: [
                  TextField(
                    controller: controller.searchTextController,
                    onChanged: (text) => controller.onSearch(text),
                    style: GoogleFonts.roboto(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                          left: 8
                        ),
                        child: Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.white.withOpacity(.5)
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12)
                    ),
                    cursorColor: Colors.white,
                  ),
                  if(controller.showClearSearch.value) Positioned(
                    right: 8,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () => controller.clearSearch(context),
                      constraints: BoxConstraints(),
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [

              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: CColors.primary_light,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onChanged: controller.onFilterChange,
                          items: controller.filterOptions.map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item
                            ),
                          )).toList(),
                          value: controller.selectedFilter.value,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            color: CColors.primary
                          ),
                          iconEnabledColor: CColors.primary,
                          iconDisabledColor: CColors.primary,
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: CColors.primary_light,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CButton(
                      onPressed: () => Get.to(()=>PayNewInvoicePage()),
                      color: CColors.primary_light,
                      labelColor: CColors.primary,
                      labelSize: 14,
                      label: 'Pay New Invoice',
                      icon: Icons.add,
                      iconColor: CColors.primary,
                    )
                  )
                ],
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: CColors.greyf9
                  ),
                  padding: EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: allInvoices.length,
                    itemBuilder: (_, index) => _InvoiceWidget(
                      invoice: allInvoices[index]
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class _InvoiceWidget extends StatelessWidget {
  final InvoiceModel invoice;
  
  const _InvoiceWidget({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 14
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: CColors.grey_light2
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invoice Description',
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: CColors.primary
            ),
          ),
          Text(
            invoice.description,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              color: CColors.black
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date Paid',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: CColors.primary
                      ),
                    ),
                    Text(
                      invoice.date,
                      style: GoogleFonts.roboto(
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
                      'Amount',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: CColors.primary
                      ),
                    ),
                    Text(
                      '\$${invoice.amount}',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        color: CColors.black
                      ),
                    ),
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
