import 'package:flutter/material.dart';

import 'blogmodel.dart';

class Blogdetails extends StatelessWidget {
  const Blogdetails({super.key, required this.blogmodel,});
final Blogmodel blogmodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(blogmodel.mainTitle.toString())),
      body: ListView.builder(itemBuilder: (context,index){
return Container(
  child: Column(children: [
    Text(blogmodel.blogTitles[index]),
  Text(blogmodel.blogContents[index]),
    blogmodel.imageUrls.isEmpty? SizedBox() :Image.network(blogmodel.imageUrls[index]),
  ],),
);

      },itemCount: blogmodel.blogTitles.length,),
    );
  }
}
