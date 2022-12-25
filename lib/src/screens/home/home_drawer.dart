import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDrawer extends StatelessWidget {
  const  HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller  = Get.find<HomeController>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10)
        ),
        color: Colors.white
      ),
      width: Get.width * .8,
      child: Obx((){
        print(controller.activeDrawerIndex);
        return Column(
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              currentAccountPicture: CircleAvatar(
                child: FlutterLogo(),
              ),
              accountName: Text(
                'user_name',
                style: TextStyle(
                  color: CColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              ),
              accountEmail: Text(
                'user_email@gmail.com',
                style: TextStyle(
                  fontSize: 12,
                  color: CColors.grey
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: DrawerItemModel.drawerItems.length,
                itemBuilder: (_, index) => _DrawerItem(
                  label: DrawerItemModel.drawerItems[index].label,
                  icon: DrawerItemModel.drawerItems[index].icon,
                  active: controller.activeDrawerIndex.value == index,
                  onTap: (){
                    controller.activeDrawerIndex(index);
                    controller.scaffoldKey.currentState!.closeDrawer();
                  }
                ),
              ),
            ),

            Container(
              height: 70,
              color: CColors.primary_dark,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    CIcons.swap_vert,
                    color: Colors.white
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Sites',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback onTap;
  final bool active;
  const _DrawerItem({Key? key, required this.label,required this.icon,required this.active,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        color: active ? CColors.primary_light : Colors.white,
        child: Row(
          children: [
            Container(
              width: 6,
              color: active ? CColors.primary_dark : Colors.white,
            ),
            SizedBox(width: 22),
            Image.asset(
              icon,
              height: 24,
              width: 24,
              color: active ? CColors.primary_dark : CColors.grey_light,
            ),
            SizedBox(width: 12),
            Text(
              label,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                color: active ? CColors.primary_dark : CColors.grey_light
              )
            )
          ],
        ),
      ),
    );
  }
}
