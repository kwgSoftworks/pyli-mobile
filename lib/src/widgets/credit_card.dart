import 'package:customerapp/src/helpers/string_helper.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditCardModel card;
  final bool active;
  final bool isOdd;
  final bool editMode;
  final double padding;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  const CreditCardWidget({Key? key,
    required this.card,
    this.active = false,
    this.isOdd = false,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.editMode = false,
    this.padding = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        height: 158,
        child: Stack(
          children: [
            Image.asset(
                isOdd ? Images.card_purple : Images.card_orange
            ),
            Padding(
              padding: EdgeInsets.all(14+padding/2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.name,
                        style: GoogleFonts.montserrat(
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 4),
                      Image.asset(
                        CIcons.sim,
                        width: 32,
                        height: 25,
                      )
                    ],
                  ),
                  Text(
                    StringHelper.creditCardFormatter(card.number),
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Valid Thru ',
                        style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(.60),
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),
                      ),
                      Text(
                        card.validity,
                        style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(.78),
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 12 + padding,
              right: 12 + padding,
              child: Image.asset(
                CIcons.visa,
                height: 20,
                width: 52,
              ),
            ),
            if(active) Positioned(
              right: 12,
              top: 12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 32,
                  ),
                  Text(
                    'Use This',
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            AnimatedPositioned(
              right: active && editMode ? 0 : -100,
              top: 0,
              bottom: 0,
              duration: Duration(milliseconds: 300),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color: CColors.primary_dark_max.withOpacity(.8),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  )
                ),
                padding: EdgeInsets.only(
                  top: 12
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          primary: Colors.transparent,
                        ),
                        onPressed: (){
                          if(onEdit != null) onEdit!.call();
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                        label: Text(
                          'Edit Card',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ),
                    ),
                    SizedBox(
                      height: 32,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          primary: Colors.transparent,
                        ),
                        onPressed: (){
                          if(onDelete != null) onDelete!.call();
                        },
                        icon: Icon(
                          Icons.delete,
                          color: CColors.red,
                          size: 16,
                        ),
                        label: Text(
                          'Delete Card',
                          style: GoogleFonts.roboto(
                            color: CColors.red,
                            fontSize: 10,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}