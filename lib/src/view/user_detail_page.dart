
import 'package:flutter/material.dart';
import 'package:kanbanboardapp/src/model/user_model.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.e});

  // Kullanıcı modelini tutan değişken
  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), 
      body: Center(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(e.avatar),
              ),
            ),
            const SizedBox(height: 30),
            Text("${e.firstname} ${e.lastname}"), // Kullanıcı adı ve soyadını gösteren metin
          ],
        ),
      ),
    );
  }
}
