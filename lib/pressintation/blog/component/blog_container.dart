import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Const/Colors.dart';

class BlogContainer extends StatefulWidget {
  final String ClincName;
  final void Function()? onTap;

  const BlogContainer({
    Key? key,
    required this.ClincName,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BlogContainer> createState() => _BlogContainerState();
}

class _BlogContainerState extends State<BlogContainer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print("screenHeight:$screenHeight");

    double paddingValue;
    double borderRadiusValue;
    double containerWidth;
    double containerHeight;
    double imageWidth;
    double imageHeight;
    double textFontSize;

    if (screenWidth <= 500) {
      paddingValue = 0.04 * screenWidth;
      borderRadiusValue = 0.05 * screenWidth;
      containerWidth = 0.9 * screenWidth;
      containerHeight = 0.2 * screenHeight;
      imageWidth = 0.3 * screenWidth;
      imageHeight = 0.15 * screenHeight;
      textFontSize = 0.05 * screenWidth;
    } else if (screenWidth <= 800) {
      paddingValue = 0.03 * screenWidth;
      borderRadiusValue = 0.05 * screenWidth;
      containerWidth = 0.85 * screenWidth;
      containerHeight = 0.23 * screenHeight;
      imageWidth = 0.28 * screenWidth;
      imageHeight = 0.20 * screenHeight;
      textFontSize = 0.045 * screenWidth;
    } else if (screenWidth <= 1200) {
      paddingValue = 0.02 * screenWidth;
      borderRadiusValue = 0.04 * screenWidth;
      containerWidth = 0.8 * screenWidth;
      containerHeight = 0.25 * screenHeight;
      imageWidth = 0.26 * screenWidth;
      imageHeight = 0.20 * screenHeight;
      textFontSize = 0.04 * screenWidth;
    } else if (screenWidth <= 2400) {
      paddingValue = 0.010 * screenWidth;
      borderRadiusValue = 0.035 * screenWidth;
      containerWidth = 0.75 * screenWidth;
      containerHeight = 0.28 * screenHeight;
      imageWidth = 0.15 * screenWidth;
      imageHeight = 0.25 * screenHeight;
      textFontSize = 0.035 * screenWidth;
    } else {
      paddingValue = 0.010 * screenWidth;
      borderRadiusValue = 0.035 * screenWidth;
      containerWidth = 0.75 * screenWidth;
      containerHeight = 0.28 * screenHeight;
      imageWidth = 0.15 * screenWidth;
      imageHeight = 0.25 * screenHeight;
      textFontSize = 0.035 * screenWidth;
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
              SizedBox(width: paddingValue),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(paddingValue),
                ),
              ),
              SizedBox(width: paddingValue),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.ClincName,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: textFontSize,
                        color: AppColor.Doctorcolor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 0.006 * screenHeight),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
