import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required int count,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _Project;
  factory Project.fromJson(JsonMap json) => _$ProjectFromJson(json);
}

final projectsRef = ProjectsRef();

class ProjectsRef extends CollectionRef<Project, ProjectDoc, ProjectRef> {
  ProjectsRef() : super(FirebaseFirestore.instance.collection('projects'));

  @override
  JsonMap encode(Project data) => replacingTimestamp(json: data.toJson());

  @override
  ProjectDoc decode(DocumentSnapshot<JsonMap> snapshot, ProjectRef docRef) {
    return ProjectDoc(
      docRef,
      Project.fromJson(snapshot.data()!),
    );
  }

  @override
  ProjectRef docRef(DocumentReference<JsonMap> ref) => ProjectRef(
        ref: ref,
        projectsRef: this,
      );
}

class ProjectRef extends DocumentRef<Project, ProjectDoc> {
  const ProjectRef({
    required DocumentReference<JsonMap> ref,
    required this.projectsRef,
  }) : super(
          ref: ref,
          collectionRef: projectsRef,
        );

  final ProjectsRef projectsRef;
}

class ProjectDoc extends Document<Project> {
  const ProjectDoc(
    this.projectRef,
    Project? entity,
  ) : super(projectRef, entity);

  final ProjectRef projectRef;
}
