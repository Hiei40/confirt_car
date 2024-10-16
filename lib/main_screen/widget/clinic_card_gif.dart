import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class ClinicCardGif extends StatefulWidget {
  const ClinicCardGif({super.key, required this.image, required this.name, required this.pio});
  final String? image;  // The URL or path to the GIF
  final String? name;   // Clinic name
  final String? pio;    // Clinic's description

  @override
  _ClinicCardGifState createState() => _ClinicCardGifState();
}

class _ClinicCardGifState extends State<ClinicCardGif> with SingleTickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);
    // Start the GIF animation without specifying min and max bounds
    _gifController.repeat(period: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 150,
          width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Gif(
                    controller: _gifController,
                    image: NetworkImage(widget.image!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        widget.name!,
                        style: const TextStyle(color: Colors.black),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        widget.pio!,
                        style: TextStyle(color: Colors.grey.shade400),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
