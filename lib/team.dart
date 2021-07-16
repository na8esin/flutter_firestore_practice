import 'package:cloud_firestore/cloud_firestore.dart';

import 'project.dart';

class Team {
  Team({required this.name});

  Team.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
        );

  final String name;

  Map<String, Object?> toJson() {
    return {
      'name': name,
    };
  }
}

class TeamsRef {
  static byIds(String organizationId, String projectId) =>
      withConverter(FirebaseFirestore.instance
          .collection('organizations/$organizationId/projects/$projectId'));

  static byParent(QueryDocumentSnapshot<Project> qDSProject) =>
      withConverter(qDSProject.reference.collection('teams'));

  static withConverter(CollectionReference<Map<String, dynamic>> cr) {
    cr.withConverter<Team>(
      fromFirestore: (snapshot, _) => Team.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );
  }
}
