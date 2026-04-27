import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final FirestoreService firestoreService = FirestoreService();

  // Controllers for Posts
  final postTitleController = TextEditingController();
  final postDescController = TextEditingController();

  // Controllers for Users
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();

  // ==================== POSTS DIALOG ====================
  void _openPostBox({String? docId, String? existingTitle, String? existingDesc}) {
    postTitleController.text = existingTitle ?? '';
    postDescController.text = existingDesc ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(docId == null ? "Tambah Post Baru" : "Edit Post"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: postTitleController,
              decoration: const InputDecoration(labelText: "Nama Barang"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: postDescController,
              decoration: const InputDecoration(labelText: "Deskripsi"),
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              if (docId == null) {
                firestoreService.addPost(postTitleController.text, postDescController.text);
              } else {
                firestoreService.updatePost(docId, postTitleController.text, postDescController.text);
              }
              postTitleController.clear();
              postDescController.clear();
              Navigator.pop(context);
            },
            child: Text(docId == null ? "Simpan" : "Update"),
          ),
        ],
      ),
    );
  }

  // ==================== USERS DIALOG ====================
  void _openUserBox({String? docId, String? existingName, String? existingEmail}) {
    userNameController.text = existingName ?? '';
    userEmailController.text = existingEmail ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(docId == null ? "Tambah User Baru" : "Edit User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(labelText: "Nama Lengkap"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: userEmailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              if (docId == null) {
                firestoreService.addUser(userNameController.text, userEmailController.text);
              } else {
                firestoreService.updateUser(docId, userNameController.text, userEmailController.text);
              }
              userNameController.clear();
              userEmailController.clear();
              Navigator.pop(context);
            },
            child: Text(docId == null ? "Simpan" : "Update"),
          ),
        ],
      ),
    );
  }

  // ==================== WIDGET BUILDERS ====================
  
  Widget _buildPostsTab() {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreService.getPosts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        List postsList = snapshot.data!.docs;

        return ListView.builder(
          itemCount: postsList.length,
          itemBuilder: (context, index) {
            DocumentSnapshot document = postsList[index];
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;

            // TAMBAHKAN PENGECEKAN NULL DI SINI
            String title = data['title'] ?? 'Tanpa Judul'; 
            String description = data['description'] ?? 'Tanpa Deskripsi';

            return ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.blue),
              title: Text(title), 
              subtitle: Text(description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.grey),
                    onPressed: () => _openPostBox(
                      docId: document.id,
                      existingTitle: title, // Gunakan variabel yang sudah aman dari null
                      existingDesc: description,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () => firestoreService.deletePost(document.id),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

Widget _buildUsersTab() {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreService.getUsers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        List usersList = snapshot.data!.docs;

        return ListView.builder(
          itemCount: usersList.length,
          itemBuilder: (context, index) {
            DocumentSnapshot document = usersList[index];
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;

            // TAMBAHKAN PENGECEKAN NULL DI SINI
            String name = data['name'] ?? 'Tanpa Nama';
            String email = data['email'] ?? 'Tanpa Email';

            return ListTile(
              leading: const Icon(Icons.person, color: Colors.green),
              title: Text(name),
              subtitle: Text(email),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.grey),
                    onPressed: () => _openUserBox(
                      docId: document.id,
                      existingName: name, // Gunakan variabel yang sudah aman dari null
                      existingEmail: email,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () => firestoreService.deleteUser(document.id),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? "Manajemen Posts" : "Manajemen Users"),
        elevation: 0,
      ),
      body: _currentIndex == 0 ? _buildPostsTab() : _buildUsersTab(),
      floatingActionButton: FloatingActionButton(
        onPressed: _currentIndex == 0 ? _openPostBox : _openUserBox,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Posts"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Users"),
        ],
      ),
    );
  }
}