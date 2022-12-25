import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/screens/dashboard/notification_list_page.dart';
import 'package:customerapp/src/screens/dashboard/sites_config_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller  = Get.find<HomeController>();
    return Obx(()=>AppBar(
      title: Text(
        DrawerItemModel.drawerItems[controller.activeDrawerIndex.value].label,
      ),
      actions: [
        MaterialButton(
          onPressed: (){
            Get.dialog(SitesConfigPage());
          },
          minWidth: 0,
          child: Image.asset(
            CIcons.swap_vert,
            color: Colors.white
          ),
        ),
        IconButton(
          onPressed: (){
            Get.to(()=>NotificationLitPage());
          },
          constraints: BoxConstraints(),
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          )
        ),
        SizedBox(width: 12)
      ],
    ));
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
