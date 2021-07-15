import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'book.dart';

final booksRef =
    FirebaseFirestore.instance.collection('books').withConverter<Book>(
          fromFirestore: (snapshot, _) => Book.fromJson(snapshot.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );

Future<void> main() async {
  await Firebase.initializeApp();
  final List<QueryDocumentSnapshot<Book>> books =
      await booksRef.get().then((snapshot) => snapshot.docs);
  books.map((e) => print(e.data().title));
//  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
