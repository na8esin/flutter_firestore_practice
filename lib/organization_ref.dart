import 'package:cloud_firestore/cloud_firestore.dart';

import 'organization.dart';

final organizationsRef = FirebaseFirestore.instance
    .collection('organizations')
    .withConverter<Organization>(
      fromFirestore: (snapshot, _) => Organization.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );
