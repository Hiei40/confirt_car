import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Const/Colors.dart';

class ClincsContainer2 extends StatefulWidget {
  final String photoUrl;
  final String ClincName;
  final String id;
  final void Function()? onTap;

  const ClincsContainer2({
    Key? key,
    required this.photoUrl,
    required this.ClincName,
    required this.onTap,
    required this.id,
  }) : super(key: key);

  @override
  State<ClincsContainer2> createState() => _ClincsContainer2State();
}

class _ClincsContainer2State extends State<ClincsContainer2> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double paddingValue;
    double borderRadiusValue;
    double containerWidth;
    double containerHeight;
    double imageWidth;
    double imageHeight;
    double textFontSize;

    if (screenWidth <= 500) {
      // Settings for screens up to 500 width
      paddingValue = 0.04 * screenWidth;
      borderRadiusValue = 0.05 * screenWidth;
      containerWidth = 0.9 * screenWidth;
      containerHeight = 0.2 * screenHeight;
      imageWidth = 0.3 * screenWidth;
      imageHeight = 0.15 * screenHeight;
      textFontSize = 0.05 * screenWidth;
    } else if (screenWidth <= 800) {
      // Settings for screens up to 800 width
      paddingValue = 0.03 * screenWidth;
      borderRadiusValue = 0.05 * screenWidth;
      containerWidth = 0.85 * screenWidth;
      containerHeight = 0.18 * screenHeight;
      imageWidth = 0.28 * screenWidth;
      imageHeight = 0.14 * screenHeight;
      textFontSize = 0.045 * screenWidth;
    } else if (screenWidth <= 1200) {
      // Settings for screens up to 1200 width
      paddingValue = 0.02 * screenWidth;
      borderRadiusValue = 0.04 * screenWidth;
      containerWidth = 0.8 * screenWidth;
      containerHeight = 0.16 * screenHeight;
      imageWidth = 0.26 * screenWidth;
      imageHeight = 0.13 * screenHeight;
      textFontSize = 0.04 * screenWidth;
    } else if (screenWidth <= 2400) {
      // Settings for screens up to 2400 width
      paddingValue = 0.015 * screenWidth;
      borderRadiusValue = 0.035 * screenWidth;
      containerWidth = 0.75 * screenWidth;
      containerHeight = 0.14 * screenHeight;
      imageWidth = 0.24 * screenWidth;
      imageHeight = 0.12 * screenHeight;
      textFontSize = 0.035 * screenWidth;
    } else {
      // Default settings for larger screens
      paddingValue = 0.01 * screenWidth;
      borderRadiusValue = 0.03 * screenWidth;
      containerWidth = 0.7 * screenWidth;
      containerHeight = 0.12 * screenHeight;
      imageWidth = 0.22 * screenWidth;
      imageHeight = 0.11 * screenHeight;
      textFontSize = 0.03 * screenWidth;
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.all(paddingValue),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadiusValue),
            color: AppColor.kWhite,
            border: Border.all(
              color: AppColor.KColorcircle2,
            ),
          ),
          width: containerWidth,
          height: containerHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: paddingValue,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(paddingValue),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 0.006 * screenHeight,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(paddingValue),
                          child: Image.network(
                            widget.photoUrl,
                            width: imageWidth,
                            height: imageHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: paddingValue,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.012 * screenHeight,
                  ),
                  Text(
                    "${widget.ClincName}",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: textFontSize,
                      color: AppColor.Doctorcolor,
                    ),
                  ),
                  SizedBox(
                    height: 0.006 * screenHeight,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
