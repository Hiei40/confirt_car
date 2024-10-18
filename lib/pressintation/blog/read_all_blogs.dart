import 'package:confirt_care/pressintation/blog/blogdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confirt_care/pressintation/blog/blogmodel.dart';
import 'package:confirt_care/pressintation/blog/cubit/cubit.dart';
import 'cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  // Mobile layout
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
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
                } else {
                  // Web layout
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
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
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 4,
                            shadowColor: Colors.teal.withOpacity(0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                blogmodel.imageUrls.isEmpty ? Expanded(
                            child: Container(
                            decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/comfort-care-web-site.appspot.com/o/5064889.png?alt=media&token=12695455-8223-4918-b2b3-dcf47dafe0fc"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        ),
                        ):    Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(8.0),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(blogmodel.imageUrls[0]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        blogmodel.mainTitle,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        blogmodel.blogContents[0].isNotEmpty
                                            ? blogmodel.blogContents[0]
                                            : "",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}