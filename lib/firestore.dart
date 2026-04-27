import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // --- References ---
  final CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  // ==================== POSTS CRUD ====================

  // Create Post
  Future<void> addPost(String title, String description) {
    return posts.add({
      'title': title,
      'description': description,
      'createdAt': Timestamp.now(),
    });
  }

  // Read Posts
  Stream<QuerySnapshot> getPosts() {
    return posts.orderBy('createdAt', descending: true).snapshots();
  }

  // Update Post
  Future<void> updatePost(String id, String title, String description) {
    return posts.doc(id).update({
      'title': title,
      'description': description,
      'updatedAt': Timestamp.now(),
    });
  }

  // Delete Post
  Future<void> deletePost(String id) {
    return posts.doc(id).delete();
  }

  // ==================== USERS CRUD ====================

  // Create User
  Future<void> addUser(String name, String email) {
    return users.add({
      'name': name,
      'email': email,
      'joinedAt': Timestamp.now(),
    });
  }

  // Read Users
  Stream<QuerySnapshot> getUsers() {
    return users.orderBy('joinedAt', descending: true).snapshots();
  }

  // Update User
  Future<void> updateUser(String id, String name, String email) {
    return users.doc(id).update({
      'name': name,
      'email': email,
    });
  }

  // Delete User
  Future<void> deleteUser(String id) {
    return users.doc(id).delete();
  }
}