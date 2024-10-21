import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blogmodel.dart';

import 'package:flutter/material.dart';
import 'blogmodel.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class Blogdetails extends StatelessWidget {
  const Blogdetails({super.key, required this.blogId});
  final String blogId ;

  @override
  Widget build(BuildContext context) {
    BlogCubit cubit=BlogCubit.get(context);
    cubit.BlogMainState(blogId);
    return BlocBuilder<BlogCubit,BlogMainState>(
      builder: (context,state){
        return state is SingleBlogLoading || cubit.singleBlog.isEmpty || cubit.blogBodyList.isEmpty ||cubit.imageList.isEmpty ?Scaffold(body: Center(
          child: CircularProgressIndicator(),
        ),) :Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.singleBlog["mainTitle"],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: cubit.blogTitleList.length,
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
                          cubit.blogTitleList[index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          cubit.blogBodyList[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (cubit.imageList[index].isNotEmpty)
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                height: 500,
                                width: 700,
                                child: Image.network(
                                  cubit.imageList[index],
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
    );
  }
}
