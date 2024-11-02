// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsResponseModel _$SubjectsResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubjectsResponseModel(
      message: json['message'] as String,
      metadata: json['metadata'] == null
          ? null
          : MetadataModel.fromJson(json['metadata'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectsResponseModelToJson(
        SubjectsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'subjects': instance.subjects,
    };

SubjectDataModel _$SubjectDataModelFromJson(Map<String, dynamic> json) =>
    SubjectDataModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      iconUrl: json['icon'] as String?,
    );

Map<String, dynamic> _$SubjectDataModelToJson(SubjectDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'icon': instance.iconUrl,
    };
