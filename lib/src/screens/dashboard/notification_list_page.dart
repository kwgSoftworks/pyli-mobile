import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationLitPage extends StatelessWidget {
  const NotificationLitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 1
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 18
            ),
            child: TextButton(
              onPressed: (){},
              child: Text(
                'Clear All Notification',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  color: CColors.primary
                ),
              )
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 14),
              itemBuilder: (_, index) => _NotificationTile()
            ),
          )
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'notification_title',
                maxLines: 1,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: CColors.primary,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            IconButton(
              onPressed: (){},
              constraints: BoxConstraints(),
              icon: Icon(
                Icons.clear,
                color: CColors.primary,
              ),
            )
          ],
        ),
        Text(
          'Details..... Magnis vitae elit in nibh in sed proin faucibus sed. Scelerisque netus nulla euismod lacus, est. Vivamus habitasse id vel purus. Nunc id lorem quis ac donec dui, aenean.',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            color: CColors.black
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: Get.width * .3,
          height: 42,
          child: CButton(
            label: 'Action',
          ),
        ),
        SizedBox(height: 14),
        CDivider(),
      ],
    );
  }
}
