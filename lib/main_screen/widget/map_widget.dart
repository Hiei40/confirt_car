import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});
  @override
  Widget build(BuildContext context) {
    CameraPosition kLake = const CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(30.055698, 31.357853),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    final Completer<GoogleMapController> controller =
        Completer<GoogleMapController>();
    return SingleChildScrollView(
      physics:const NeverScrollableScrollPhysics(),
      child: Container(
        height: 750,
        width: double.infinity,
        color:const Color(0xFF3559DA),
        padding:const EdgeInsets.only(right: 40, left: 40, top: 100),
        child: Column(
          children: [
            SizedBox(
              height: 360,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: kLake,
                onMapCreated: (GoogleMapController controller1) {
                  controller.complete(controller1);
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              width: double.infinity,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "comfort care",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Comfort Care Medical Services Company, project owner",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Support",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "help center",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "site feedback",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Accessibility",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Address: 8, Block 1, Mostafa Al-Nahhas _ next to Al-Manhal School - Nasr City - Cairo",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "01050002288",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "01050002299",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "0223572009",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
