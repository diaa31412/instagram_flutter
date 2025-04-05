import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String userName;
  final String postId;
  final datePublisher;
  final String posrtUrl;
  final String profImage;
  final likes;

  const Post({
    required this.description,
    required this.userName,
    required this.uid,
    required this.postId,
    required this.posrtUrl,
    required this.likes,
    required this.datePublisher,
    required this.profImage,
  });

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "uid": uid,
    "description": description,
    "profImage": profImage,
    "postId": postId,
    "posrtUrl": posrtUrl,
    "likes": likes,
    "datePublisher": datePublisher,
  };

  static Post fromSnap(DocumentSnapshot snap) {
    final data = snap.data();
    if (data == null) {
      throw Exception('No user data found in snapshot.');
    }

    final snapshot = data as Map<String, dynamic>;

    return Post(
      userName: snapshot['userName'] ?? '',
      uid: snapshot['uid'] ?? '',
      description: snapshot['description'] ?? '',
      profImage: snapshot['profImage'] ?? '',
      postId: snapshot['postId'] ?? '',
      posrtUrl: snapshot['posrtUrl'] ?? '',
      likes: snapshot['likes'] ?? '',
      datePublisher: snapshot['datePublisher'] ?? '',
    );
  }
}
