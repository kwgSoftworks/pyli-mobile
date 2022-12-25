import 'package:customerapp/src/models/_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController{
  RxList<InvoiceModel> filteredInvoiceList = <InvoiceModel>[].obs;
  RxList<InvoiceModel> allInvoice = InvoiceModel.demo.obs;


  RxBool showClearSearch = RxBool(false);
  final searchTextController = TextEditingController();
  void onSearch(String searchText){
    filteredInvoiceList.clear();
    showClearSearch(true);
    for(int i=0; i<allInvoice.length; i++){
      final file = allInvoice[i];
      if(file.description.toLowerCase().contains(searchText.toLowerCase())){
        filteredInvoiceList.add(file);
      }
    }
  }

  void clearSearch(BuildContext context){
    searchTextController.clear();
    filteredInvoiceList.clear();
    showClearSearch(false);
    FocusScope.of(context).unfocus();
  }

  final filterOptions = <String>[
    'Most Recent',
    'High Amount',
    'Low Amount'
  ];
  RxString selectedFilter = RxString('Most Recent');

  void onFilterChange(String? value){
    if(value == null) return ;
    selectedFilter(value);
  }

  Rx<CreditCardModel> selectedCard = CreditCardModel.demo.first.obs;
}