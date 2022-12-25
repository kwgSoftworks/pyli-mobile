import 'dart:ui';
import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SitesConfigPage extends StatelessWidget {
  const SitesConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SiteController());

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.8),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) => Stack(
            children: [
              Column(
                children: [

                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                        top: 42,
                        left: Get.width * .22,
                        right: Get.width * .22,
                      ),
                      itemCount: controller.allSites.length,
                      itemBuilder: (_, index) => _SitesWidget(
                          onTap: (){
                            controller.selectedSite(controller.allSites[index]);
                            setState((){});
                          },
                          item: controller.allSites[index],
                          active: controller.allSites[index] == controller.selectedSite.value
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                      left: Get.width * .2,
                      right: Get.width * .2,
                    ),
                    child: CButton(
                      label: 'Add New Site',
                    ),
                  )

                ],
              ),
              Positioned(
                top: 22,
                right: 14,
                child: IconButton(
                  onPressed: Get.back,
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ))
        ),
      ),
    );
  }
}

class _SitesWidget extends StatelessWidget {
  final SiteModel item;
  final bool active;
  final VoidCallback onTap;
  const _SitesWidget({Key? key, required this.item, required this.active, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 20
              ),
              decoration: BoxDecoration(
                color: active ? CColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: !active ? Border.all(
                  color: CColors.primary,
                  width: 4
                ) : null
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    active ? Images.map : Images.map_grey,
                    height: 50,
                    width: 50,
                  ),
                  Column(
                    children: [
                      Text(
                        item.title,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item.subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            if(active) CircleAvatar(
              backgroundColor: CColors.primary_light,
              child: Icon(
                CupertinoIcons.checkmark_alt,
                color: CColors.primary,
                size: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
