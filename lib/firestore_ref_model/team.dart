import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'project.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    required String name,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _Team;
  factory Team.fromJson(JsonMap json) => _$TeamFromJson(json);
}

/*
  TeamsRef
  TeamRef
  TeamDoc
*/

class TeamsRef extends CollectionRef<Team, TeamDoc, TeamRef> {
  TeamsRef(this.cr) : super(cr);
  final CollectionReference<Map<String, dynamic>> cr;

  factory TeamsRef.parentDoc(ProjectDoc doc) =>
      TeamsRef(doc.projectRef.ref.collection('teams'));

  factory TeamsRef.ids(String grandParentId, String parentId) =>
      TeamsRef(FirebaseFirestore.instance
          .collection('organizations/$grandParentId/projects/$parentId/teams'));

  @override
  JsonMap encode(Team data) => replacingTimestamp(json: data.toJson());

  @override
  TeamDoc decode(DocumentSnapshot<JsonMap> snapshot, TeamRef docRef) {
    return TeamDoc(
      docRef,
      Team.fromJson(snapshot.data()!),
    );
  }

  @override
  TeamRef docRef(DocumentReference<JsonMap> ref) => TeamRef(
        ref: ref,
        teamsRef: this,
      );
}

class TeamRef extends DocumentRef<Team, TeamDoc> {
  const TeamRef({
    required DocumentReference<JsonMap> ref,
    required this.teamsRef,
  }) : super(
          ref: ref,
          collectionRef: teamsRef,
        );

  final TeamsRef teamsRef;
}

class TeamDoc extends Document<Team> {
  const TeamDoc(
    this.teamRef,
    Team? entity,
  ) : super(teamRef, entity);

  final TeamRef teamRef;
}
