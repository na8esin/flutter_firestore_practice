import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organization.freezed.dart';
part 'organization.g.dart';

@freezed
class Organization with _$Organization {
  const factory Organization({
    required int count,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _Organization;
  factory Organization.fromJson(JsonMap json) => _$OrganizationFromJson(json);
}

final organizationsRef = OrganizationsRef();

class OrganizationsRef
    extends CollectionRef<Organization, OrganizationDoc, OrganizationRef> {
  OrganizationsRef()
      : super(FirebaseFirestore.instance.collection('organizations'));

  @override
  JsonMap encode(Organization data) => replacingTimestamp(json: data.toJson());

  @override
  OrganizationDoc decode(
      DocumentSnapshot<JsonMap> snapshot, OrganizationRef docRef) {
    return OrganizationDoc(
      docRef,
      Organization.fromJson(snapshot.data()!),
    );
  }

  @override
  OrganizationRef docRef(DocumentReference<JsonMap> ref) => OrganizationRef(
        ref: ref,
        organizationsRef: this,
      );
}

class OrganizationRef extends DocumentRef<Organization, OrganizationDoc> {
  const OrganizationRef({
    required DocumentReference<JsonMap> ref,
    required this.organizationsRef,
  }) : super(
          ref: ref,
          collectionRef: organizationsRef,
        );

  final OrganizationsRef organizationsRef;
}

class OrganizationDoc extends Document<Organization> {
  const OrganizationDoc(
    this.organizationRef,
    Organization? entity,
  ) : super(organizationRef, entity);

  final OrganizationRef organizationRef;
}
