import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';

class Blogs extends StatelessWidget {
  const Blogs({super.key});

  @override
  Widget build(BuildContext context) {
    BlogCubit cubit = BlogCubit.get(context);
    TextEditingController titleController = TextEditingController();

    // Initialize lists of TextEditingController for blog titles and contents based on current index
    List<TextEditingController> blogTitles = List.generate(cubit.index, (index) => TextEditingController());
    List<TextEditingController> blogContents = List.generate(cubit.index, (index) => TextEditingController());

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Blogs",
      //     style: TextStyle(
      //       fontWeight: FontWeight.w600,
      //       fontSize: 24,
      //       color: Colors.white,
      //     ),
      //   ),
      //   backgroundColor: Colors.deepPurpleAccent,
      //   elevation: 4,
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Blog Main Title",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      style: const TextStyle(fontSize: 20),
                      controller: titleController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        hintText: "Enter main title here",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<BlogCubit, BlogMainState>(
                builder: (context, state) {
                  // Refresh controllers based on cubit.index
                  blogTitles = List.generate(cubit.index, (index) => TextEditingController());
                  blogContents = List.generate(cubit.index, (index) => TextEditingController());

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.index,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Blog Title",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: blogTitles[i],
                                style: const TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                  hintText: "Enter title here",
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              const Text(
                                "Blog Content",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: blogContents[i],
                                maxLines: 8,
                                style: const TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(16),
                                  hintText: "Write your blog content here...",
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.image,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onPressed: () {
                                      cubit.filepicker();
                                    },
                                    tooltip: "Add Image",
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Here you might want to manage adding a new blog without exceeding index limits
                                      if (cubit.index < 20) {
                                        cubit.cont(); // Increment index and trigger rebuild
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurpleAccent,
                                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text(
                                      "Add Blog",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Divider(thickness: 1),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                List<String> titles = blogTitles.map((controller) => controller.text).toList();
                List<String> contents = blogContents.map((controller) => controller.text).toList();

                // Log before calling addToBlogs
                print("Adding blogs with main title: ${titleController.text}, titles: $titles, contents: $contents");

                cubit.addToBlogs(
                  titleController.text,
                  titles,
                  contents,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text(
                    "Post Blogs",
                    style: TextStyle(color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
