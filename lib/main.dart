import 'package:cloud_firestore/cloud_firestore.dart';

import 'organization.dart';
import 'organization_ref.dart';
import 'boringInitialization.dart';

Future<void> main() async {
  await boringInitialization();

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
