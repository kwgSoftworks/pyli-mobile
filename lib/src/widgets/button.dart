import 'package:auto_size_text/auto_size_text.dart';
import 'package:customerapp/src/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? label;
  final Color? color;
  final Color? iconColor;
  final Color labelColor;
  final BorderSide? border;
  final bool loading;
  final double borderCurve;
  final double labelSize;
  final IconData? icon;
  const CButton({Key? key,
    this.onPressed,
    this.label,
    this.color,
    this.border,
    this.borderCurve = 10,
    this.labelSize = 16,
    this.loading = false,
    this.labelColor = Colors.white,
    this.iconColor = Colors.white,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        FocusScope.of(context).unfocus();
        if(onPressed != null) onPressed!.call();
      },
      style: ElevatedButton.styleFrom(
        primary: color ?? CColors.primary,
        elevation: 0,
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderCurve),
          side: border ?? BorderSide.none
        ),
      ),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: loading ?
        SizedBox(
          height: 32,
          width: 32,
          child: CircularProgressIndicator(
            color: Colors.white,
              strokeWidth: 2.5,
          ),
        ) :
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon != null) Padding(
              padding: EdgeInsets.only(
                right: 6
              ),
              child: Icon(
                icon,
                size: 20,
                color: iconColor ?? CColors.primary,
              ),
            ),
            Flexible(
              child: AutoSizeText(
                label ?? 'Done',
                maxLines: 1,
                style: GoogleFonts.roboto(
                  color: labelColor,
                  fontSize: labelSize,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class CBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  const CBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
        if(onTap != null) onTap!.call();
      },
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffF5F5F5)
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.chevron_back,
            color: Color(0xff323232),
          ),
        ),
      ),
    );
  }
}

