import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout)),);
  }
}
