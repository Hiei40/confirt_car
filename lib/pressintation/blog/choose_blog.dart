import 'package:confirt_care/pressintation/blog/component/blog_container.dart';
import 'package:confirt_care/pressintation/blog/read_all_blogs.dart';
import 'package:flutter/material.dart';

import 'blogs.dart';

class ChooseBlog extends StatelessWidget {
  const ChooseBlog({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> Blogscreen=[Blogs(),ReadAllBlogs()];
    List<String> Blogstext=["Write Blogs","read All Blogs"];
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: ListView.builder(itemBuilder:  (BuildContext context, int index) {
    return  BlogContainer(ClincName: Blogstext[index],
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Blogscreen[index]));


    }
    );


        },
          itemCount: Blogstext.length, // Specify the number of items

        ),
      ),
    );
  }
}
