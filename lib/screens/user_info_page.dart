import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/get_user_name.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final user = FirebaseAuth.instance.currentUser;

  List<String> userIDs = [];

  Future getUserIDs() async {
    await FirebaseFirestore.instance
        .collection('users').orderBy('firstName', descending: false)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              // print(document.reference);
              userIDs.add(document.reference.id);
            }));
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user!.email!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: (() {
          FirebaseAuth.instance.signOut();
        }),
        child: const Icon(
          Icons.exit_to_app,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getUserIDs(),
                  builder: (BuildContext context, snapshot) {
                    return ListView.builder(
                        itemCount: userIDs.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GetUserName(userName: userIDs[index]),
                            ],
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
