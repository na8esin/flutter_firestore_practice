import 'package:cloud_firestore/cloud_firestore.dart';

import 'organization.dart';
import 'organization_ref.dart';
import 'boringInitialization.dart';

Future<void> main() async {
  await boringInitialization();
  await sample3();
}

sample() async {
// QueryDocumentSnapshot<Book>に名前をつけたくなる
  final QuerySnapshot<Organization> qSOrganization =
      await organizationsRef.get();

  final List<QueryDocumentSnapshot<Organization>> qDSOrganizations =
      qSOrganization.docs;

  qDSOrganizations.forEach((QueryDocumentSnapshot<Organization> element) {
    final Organization entity = element.data();
    print(entity.name);
  });
}

sample2() async {
  // firestore_refのOrganizationRef.refに相当
  final DocumentReference<Organization> doc = organizationsRef.doc();
  final DocumentSnapshot<Organization> docSnapshot = await doc.get();
}

sample3() async {
  final docRef = FirebaseFirestore.instance
      .collectionGroup('projects')
      .firestore
      .doc('MgHUATc8GXHSHTOuTX1D');
  // a document path must point to a valid document.)

  // data()['name'] などが使える
  final documentSnapshot = await docRef.get();

  final querySnapshot = await docRef.collection('teams').get();
  querySnapshot.docs.forEach((element) {
    print(element.data()['name']);
  });
}

// a collection path passed to collectionGroup() cannot contain "/"
collectionGroupSample() async {
  final snap = await FirebaseFirestore.instance
      .collectionGroup('projects/MgHUATc8GXHSHTOuTX1D')
      .get();
  snap.docs.forEach((element) {
    print(element.data()['name']);
  });
}

// https://stackoverflow.com/questions/56149601/firestore-collection-group-query-on-documentid
// できないっぽい
fun() {
  //FirebaseFirestore.instance.collectionGroup('project').where(
  // とかできないし、存在しない
  //FirebaseFirestore.FieldPath.documentId()
  //    );
}
