import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/cubit/state.dart';
import 'cubit/cubit.dart';

class Blogs extends StatelessWidget {
  const Blogs({super.key});

  @override
  Widget build(BuildContext context) {
    BlogCubit  cubit=BlogCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("blogs"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Blogs()
                  ));
            },
            child: Text("blogs"),
          )
        ],
      ),
      body: BlocBuilder<BlogCubit,BlogMainState>(
        builder: (context,state) {
          return ListView.builder(
            itemCount: cubit.index,
            shrinkWrap: true,
            itemBuilder: (context,i) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes the position of the shadow
                                ),
                              ],
                            ),
                            child: TextField(
                            maxLines: 3,
                              decoration: InputDecoration(
                                hintText: "title",
                                border: InputBorder.none
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.white
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes the position of the shadow
                                ),
                              ],
                            ),
                            child: TextField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                  hintText: "body",
                                  border: InputBorder.none
                              ),
                            ),
                          ),

                          ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 550.0,top: 30),
                    child: InkWell(
                      onTap: (){
                        cubit.cont();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Text("+",style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        SizedBox(width: 1015,),
                        InkWell(onTap: (){},child: Container(
                          child: Text("add link"),
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 550.0,top: 30),
                    child: InkWell(onTap:(){},child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      alignment: Alignment.center,
                      child: Text("add image"),
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 550,top: 30),
                    child: InkWell(onTap:(){},child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      alignment: Alignment.center,
                      child: Text("add all"),
                    )),
                  )
                ],
              );
            }
          );
        }
      ),
    );
  }
}
