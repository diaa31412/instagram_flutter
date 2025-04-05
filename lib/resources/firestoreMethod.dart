import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_flutter/models/post.dart';
import 'package:instagram_flutter/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post

  Future<String> uploadPost(
    String description,
    String uid,
    Uint8List file,
    String userName,
    String profImage,
  ) async {
    String res = "Some Error occured";
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage(
        'posts',
        file,
        true,
      );
      String posId = Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        userName: userName,
        postId: posId,
        datePublisher: DateTime.now(),
        posrtUrl: photoUrl,
        profImage: profImage,
        likes: [],
      );

      _firestore.collection('posts').doc(posId).set(post.toJson());
      res = 'Success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
