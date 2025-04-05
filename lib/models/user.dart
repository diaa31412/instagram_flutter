import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String userName;
  final String bio;
  final List followers;
  final List following;
  // final String photoUrl;

  const User({
    required this.email,
    required this.userName,
    required this.bio,
    required this.followers,
    required this.following,
    // required this.photoUrl,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "uid": uid,
    "email": email,
    // "photoUrl": photoUrl,
    "bio": bio,
    "followers": followers,
    "following": following,
  };

  static User fromSnap(DocumentSnapshot snap) {
    final data = snap.data();
    if (data == null) {
      throw Exception('No user data found in snapshot.');
    }

    final snapshot = data as Map<String, dynamic>;

    return User(
      userName: snapshot['userName'] ?? '',
      uid: snapshot['uid'] ?? '',
      email: snapshot['email'] ?? '',
      // photoUrl: snapshot['photoUrl'] ?? '',
      bio: snapshot['bio'] ?? '',
      followers: List<String>.from(snapshot['followers'] ?? []),
      following: List<String>.from(snapshot['following'] ?? []),
    );
  }
}
