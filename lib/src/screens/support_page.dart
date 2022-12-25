import 'package:cached_network_image/cached_network_image.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(14),
      itemCount: SupportModel.demo.length,
      itemBuilder: (_, index) => _SupportWidget(
        item: SupportModel.demo[index]
      ),
    );
  }
}

class _SupportWidget extends StatelessWidget {
  final SupportModel item;
  const _SupportWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
        bottom: 20
      ),
      decoration: BoxDecoration(
        color: CColors.greyf9,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16/9,
            child: CachedNetworkImage(
              imageUrl: item.image,
            ),
          ),
          SizedBox(height: 12),
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: CColors.black
            ),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                onTap: (){},
                icon: FontAwesomeIcons.twitter
              ),
              _SocialIcon(
                onTap: (){},
                icon: FontAwesomeIcons.facebookF
              ),
              _SocialIcon(
                onTap: (){},
                icon: FontAwesomeIcons.instagram
              ),
              _SocialIcon(
                onTap: (){},
                icon: FontAwesomeIcons.linkedinIn
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  Text(
                    'Email',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    item.email,
                    style: TextStyle(
                      color: CColors.grey_dark
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Phone',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    item.phone,
                    style: TextStyle(
                      color: CColors.grey_dark
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Address',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    item.address,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CColors.grey_dark
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: CButton(
                  label: 'Email Us',
                  icon: Icons.email,
                  iconColor: Colors.white
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: CButton(
                  label: 'Call Us',
                  icon: Icons.call,
                  iconColor: Colors.white
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _SocialIcon({Key? key, required this.onTap, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CColors.primary
        ),
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Center(
          child: FaIcon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}
