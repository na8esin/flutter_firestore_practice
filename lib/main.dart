import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_practice/organization_ref.dart';

import 'organization.dart';
import 'organization_ref.dart';
import 'credentials.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password));

  // QueryDocumentSnapshot<Book>に名前をつけたくなる
  final List<QueryDocumentSnapshot<Organization>> qDSBooks =
      await organizationsRef.get().then((snapshot) => snapshot.docs);
  qDSBooks.forEach((element) {
    print(element.data().name);
  });
}
