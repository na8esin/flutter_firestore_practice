import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'credentials.dart';

// https://github.com/flutter/codelabs/blob/8409495b05f6715297727b92c6507ba2a20e97cb/in_app_purchases/complete/app/lib/logic/dash_purchases.dart#L80
// buyNonConsumable()にawaitついてる
//
// https://github.com/flutter/plugins/blob/master/packages/in_app_purchase/in_app_purchase/example/lib/main.dart#L303
// awaitがないけど大丈夫か？のテスト

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: MyBody(),
    ));
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('firestore update'),
        onPressed: () {
          // awaitをつけなくても更新はできる
          FirebaseFirestore.instance
              .collection('sample')
              .add({'title': 'no await example'});
        },
      ),
    );
  }
}
