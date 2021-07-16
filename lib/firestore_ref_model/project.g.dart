// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$_$_ProjectFromJson(Map<String, dynamic> json) {
  return _$_Project(
    count: json['count'] as int,
    createdAt:
        const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    updatedAt:
        const TimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
  );
}

Map<String, dynamic> _$_$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'count': instance.count,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
