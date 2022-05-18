import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  GetUserName({
    Key? key,
    required this.userName,
  }) : super(key: key);
  final String userName;

  CollectionReference user = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(userName).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)  {
       
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return ListTile(
            title: Text(
              'Full Name: ${data['firstName']} ${data['lastName']}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
            ),
            subtitle: Text(
              'Age: ${data['age']}',
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.blueGrey[800]),
            ),
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,
              top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Skelton(
                    height: 16,
                    width: 220,
                  ),
                  Skelton(
                    height: 16,
                    width: 70,
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({Key? key, this.height, this.width}) : super(key: key);
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: height,
      width: width,
      // margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}
