import 'package:flutter/material.dart';

class Aboutuscontainer extends StatelessWidget {
  const Aboutuscontainer({super.key, required this.ImageNetwork, required this.Name, required this.AboutClinic, this.onTap});
final String ImageNetwork;
final String Name;
final String AboutClinic;
 final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(ImageNetwork),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        Name,
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        AboutClinic,
                        style: TextStyle(color: Colors.grey.shade400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
