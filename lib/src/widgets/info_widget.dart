import 'package:customerapp/src/resources/_resources.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const InfoWidget({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 14
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: CColors.primary
            ),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: CColors.black
            ),
          ),
        ],
      ),
    );
  }
}