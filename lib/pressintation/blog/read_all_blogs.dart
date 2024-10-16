import 'package:confirt_care/pressintation/blog/blogdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confirt_care/pressintation/blog/blogmodel.dart';
import 'package:confirt_care/pressintation/blog/cubit/cubit.dart';
import 'cubit/state.dart';

class ReadAllBlogs extends StatelessWidget {
  const ReadAllBlogs({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BlogCubit>().GetBlogsData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Blogs'),
      ),
      body: BlocBuilder<BlogCubit, BlogMainState>(
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: context.read<BlogCubit>().blog.length,
                itemBuilder: (context, index) {
                  Blogmodel blogmodel = context.read<BlogCubit>().blog[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Blogdetails(
                                blogmodel: blogmodel,
                              )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        shadowColor: Colors.teal.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                blogmodel.mainTitle,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                blogmodel.blogContents[0].isNotEmpty
                                    ? blogmodel.blogContents[0]
                                    : "",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
