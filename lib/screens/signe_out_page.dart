import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigneOutPage extends StatefulWidget {
  const SigneOutPage({Key? key}) : super(key: key);

  @override
  State<SigneOutPage> createState() => _SigneOutPageState();
}

class _SigneOutPageState extends State<SigneOutPage> {
  final user = FirebaseAuth.instance.currentUser;

  List<String> userIDs = [];

  Future getUserIDs() async {
  await  FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              userIDs.add(document.reference.id);
            }));
  }

  // @override
  // void initState() {
  //   getUserIDs();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'Signe in as:\n${user!.email!}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text(
                    'Sign out',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: getUserIDs(),
                  builder: (BuildContext context, snapshot) {
                    return ListView.builder(
                        itemCount: userIDs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              userIDs[index],
                              style: const TextStyle(color: Colors.black),
                            ),
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
