import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confirt_care/pressintation/blog/cubit/state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class BlogCubit extends Cubit<BlogMainState> {
  BlogCubit() : super(BlogInitState());

  static BlogCubit get(BuildContext context) => BlocProvider.of(context);
  int index = 1;

  List<String> selectedImages = [];
  List<String> imageUrls = [];
  List<String> blogTitles = [];
  List<String> blogContents = [];

  void cont() {
    if (index < 20) {
      index += 1;
    }
    emit(CountState());
  }

  void filepicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
      );

      if (result != null && result.files.isNotEmpty) {
        selectedImages.clear(); // Clear previous selections
        imageUrls.clear(); // Clear previous URLs

        for (var file in result.files) {
          if (kIsWeb) {
            final bytes = file.bytes;
            if (bytes != null) {
              String fileName = file.name;
              Reference storageRef =
              FirebaseStorage.instance.ref().child('blog_images/$fileName');
              UploadTask uploadTask = storageRef.putData(bytes);

              try {
                TaskSnapshot snapshot = await uploadTask;

                if (snapshot.state == TaskState.success) {
                  String downloadUrl = await storageRef.getDownloadURL();
                  imageUrls.add(downloadUrl); // Add the URL to the list
                } else {
                  print('Error uploading image: ${snapshot.state}');
                }
              } catch (uploadError) {
                print('Upload failed: $uploadError');
              }
            }
          } else {
            if (file.path != null) {
              selectedImages.add(file.path!);
              Reference storageRef =
              FirebaseStorage.instance.ref().child('blog_images/${file.name}');
              UploadTask uploadTask = storageRef.putFile(File(file.path!));

              try {
                TaskSnapshot snapshot = await uploadTask;

                if (snapshot.state == TaskState.success) {
                  String downloadUrl = await storageRef.getDownloadURL();
                  imageUrls.add(downloadUrl); // Add the URL to the list
                } else {
                  print('Error uploading image: ${snapshot.state}');
                }
              } catch (uploadError) {
                print('Upload failed: $uploadError');
              }
            }
          }
        }
        // emit(BlogImageAddedState());
      }
    } catch (e) {
      // emit(BlogErrorState(e.toString()));
    }
  }

  Future<void> addToBlogs(String mainTitle, List<String> titles, List<String> contents) async {
      await FirebaseFirestore.instance.collection('blogs').add({
        'mainTitle': mainTitle,
        'blogTitles': titles,
        'blogContents': contents,
        'imageUrls': imageUrls,
        'timestamp': FieldValue.serverTimestamp(),
      });

  }

}
