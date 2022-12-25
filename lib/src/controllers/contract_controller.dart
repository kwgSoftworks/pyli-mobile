import 'package:get/get.dart';

class ContractController extends GetxController{
  static final ContractController get = Get.isRegistered<ContractController>() ? Get.find() : Get.put(ContractController());

  RxList<String> sites = ['Site 1 - 1234 Green RD', 'Site 2 - 8765 Blue RD'].obs;
  RxString selectedSite = 'Site 1 - 1234 Green RD'.obs;
}