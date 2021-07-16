import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'book.dart';
import 'credentials.dart';

final booksRef =
    FirebaseFirestore.instance.collection('books').withConverter<Book>(
          fromFirestore: (snapshot, _) => Book.fromJson(snapshot.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password));

  // QueryDocumentSnapshot<Book>に名前をつけたくなる
  final List<QueryDocumentSnapshot<Book>> qDSBooks =
      await booksRef.get().then((snapshot) => snapshot.docs);
  qDSBooks.forEach((element) {
    print(element.data().title);
  });
//  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
