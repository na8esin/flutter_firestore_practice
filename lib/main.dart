import 'package:cloud_firestore/cloud_firestore.dart';

import 'organization.dart';
import 'organization_ref.dart';
import 'boringInitialization.dart';

Future<void> main() async {
  await boringInitialization();

  // QueryDocumentSnapshot<Book>に名前をつけたくなる
  final List<QueryDocumentSnapshot<Organization>> qDSBooks =
      await organizationsRef.get().then((snapshot) => snapshot.docs);
  qDSBooks.forEach((element) {
    print(element.data().name);
  });
}
