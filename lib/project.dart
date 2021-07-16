import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  Project({required this.name});

  Project.fromJson(Map<String, Object?> json)
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

final projectsRef = (String organizationId) => FirebaseFirestore.instance
    .collection('organizations/$organizationId')
    .withConverter<Project>(
      fromFirestore: (snapshot, _) => Project.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );
