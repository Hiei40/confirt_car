import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Const/Colors.dart';

class ClincsContainer2 extends StatefulWidget {
  final String photoUrl; // corrected parameter name
  final String ClincName; // corrected parameter name
  final String id;
  final void Function()? onTap;

  const ClincsContainer2({
    Key? key,
    required this.photoUrl, // corrected parameter name
    required this.ClincName, // corrected parameter name

    required this.onTap, required this.id,
  }) : super(key: key);

  @override
  State<ClincsContainer2> createState() => _ClincsContainer2State();
}

class _ClincsContainer2State extends State<ClincsContainer2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.all(
            0.0121654501216545 * MediaQuery.of(context).size.width),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                0.048661800486618 * MediaQuery.of(context).size.width),
            color: AppColor.kWhite,
            border: Border.all(
              color: AppColor.KColorcircle2,
            ),
          ),
          width: 0.8126520681265207 * MediaQuery.of(context).size.width,
          height: 0.1441753171856978 * MediaQuery.of(context).size.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 0.024330900243309 * MediaQuery.of(context).size.width,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      0.024330900243309 * MediaQuery.of(context).size.width),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 0.0057670126874279 *
                              MediaQuery.of(context).size.height,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              0.024330900243309 *
                                  MediaQuery.of(context).size.width),
                          child: Image.network(
                            widget.photoUrl,
                            width: 0.267639902676399 *
                                MediaQuery.of(context).size.width,
                            height: 0.1268742791234141 *
                                MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 0.024330900243309 * MediaQuery.of(context).size.width,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height:
                        0.0115340253748558 * MediaQuery.of(context).size.height,
                  ),
                  Text(
                    "${widget.ClincName}", // corrected usage
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 0.0437956204379562 *
                          MediaQuery.of(context).size.width,
                      color: AppColor.Doctorcolor,
                    ),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0057670126874279,
                  ),
                  SizedBox(
                    height:
                        0.0057670126874279 * MediaQuery.of(context).size.height,
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
