import 'package:customerapp/src/models/_models.dart';
import 'package:get/get.dart';

class SiteController extends GetxController{

  Rx<SiteModel> selectedSite = SiteModel.demo.first.obs;
  RxList<SiteModel> allSites = SiteModel.demo.obs;

}