import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'credentials.dart';

boringInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password));
}
