import 'package:confirt_care/utils/widget/app_bar.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            MainAppBar(),
            Container(
              width: double.infinity,
              height: 1200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image/comfrt_cover.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );

  }
}
