import 'package:flutter/material.dart';

import '../../utils/widget/app_bar.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: LayoutBuilder(
          builder: (context,constraints) {
            return   constraints.maxWidth < 600? Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("image/cover Image.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                MainAppBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: Row(
                    children: [
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 190),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hotline : ",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "01050002288",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ):
           Stack(
            children: [
              LayoutBuilder(
                  builder: (context,constraints) {
                    return constraints.maxWidth < 600? Container():
                    Container(
                    width: double.infinity,
                    height: 800,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("image/cover Image.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
              ),
              MainAppBar(),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: Row(
                  children: [
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 1275),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hotline : ",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "01050002299",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    )    ;
  }
}
