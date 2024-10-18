import 'package:flutter/material.dart';

import 'blogmodel.dart';

import 'package:flutter/material.dart';
import 'blogmodel.dart';

class Blogdetails extends StatelessWidget {
  const Blogdetails({super.key, required this.blogmodel});
  final Blogmodel blogmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          blogmodel.mainTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: blogmodel.blogTitles.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blogmodel.blogTitles[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      blogmodel.blogContents[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (blogmodel.imageUrls.isNotEmpty)
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            height: 500,
                            width: 700,
                            child: Image.network(
                              blogmodel.imageUrls[index],
                              fit: BoxFit.contain,
                              height: 500,
                              width: 700,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), // Remove semicolon
                            ),
                          ),
                          Spacer(),
                        ],
                      ),

                    // ClipRRect(
                      //   borderRadius: BorderRadius.circular(10),
                      //   child: Image.network(
                      //     blogmodel.imageUrls[index],
                      //     fit: BoxFit.contain,
                      //     height: 300,
                      //
                      //     width: 100,
                      //     loadingBuilder: (context, child, loadingProgress) {
                      //       if (loadingProgress == null) return child;
                      //       return Center(
                      //         child: CircularProgressIndicator(
                      //           value: loadingProgress.expectedTotalBytes != null
                      //               ? loadingProgress.cumulativeBytesLoaded /
                      //               (loadingProgress.expectedTotalBytes ?? 1)
                      //               : null,
                      //         ),
                      //       );
                      //     },
                      //     errorBuilder: (context, error, stackTrace) =>
                      //     const Icon(Icons.broken_image, size: 50),
                      //   ),
                      // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
