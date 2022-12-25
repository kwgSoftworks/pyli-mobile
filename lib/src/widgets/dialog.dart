import 'dart:ui';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteDialog extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final Widget? widget;
  const DeleteDialog({Key? key,
    required this.onConfirm,
    this.title,
    this.subtitle,
    this.onCancel,
    this.widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: Get.back,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.8),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(
                horizontal: 14,
                vertical: widget == null ? Get.height * .325 : Get.height * .2
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? 'Confirm Delete ?',
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: CColors.black
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle ?? 'Are you sure you want to delete?',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: CColors.black.withOpacity(.5)
                      ),
                    ),
                    if(widget != null) widget!,
                    Spacer(),
                    CButton(
                      onPressed: onConfirm,
                      label: 'DELETE',
                      color: CColors.red_bright,
                    ),
                    SizedBox(height: 12),
                    CButton(
                      onPressed: onCancel ?? Get.back,
                      label: 'Cancel',
                    ),
                  ],
                ),
              )
            )
          ),
        ),
      ),
    );
  }
}