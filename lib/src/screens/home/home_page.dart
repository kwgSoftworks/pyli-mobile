import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/screens/billing/billing_home_page.dart';
import 'package:customerapp/src/screens/contract/contract_page.dart';
import 'package:customerapp/src/screens/dashboard/dash_board_page.dart';
import 'package:customerapp/src/screens/faq.dart';
import 'package:customerapp/src/screens/files/files_list_screen.dart';
import 'package:customerapp/src/screens/home/home_appbar.dart';
import 'package:customerapp/src/screens/home/home_drawer.dart';
import 'package:customerapp/src/screens/invoice/invoice_list_page.dart';
import 'package:customerapp/src/screens/profile/profile_page.dart';
import 'package:customerapp/src/screens/support_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    final pages = [
      DashBoardPage(),
      FilesListPage(),
      InvoiceListPage(),
      ContractPage(),
      BillingHomePage(),
      ProfilePage(),
      FaqPage(),
      SupportPage(),
    ];

    return Obx(()=>Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      appBar: HomeAppbar(),
      drawer: HomeDrawer(),
      body: pages[controller.activeDrawerIndex.value],
    ));
  }
}

