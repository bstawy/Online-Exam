// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsResponseModel _$ExamsResponseModelFromJson(Map<String, dynamic> json) =>
    ExamsResponseModel(
      message: json['message'] as String,
      metadata: json['metadata'] == null
          ? null
          : MetadataModel.fromJson(json['metadata'] as Map<String, dynamic>),
      exams: (json['exams'] as List<dynamic>)
          .map((e) => ExamDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamsResponseModelToJson(ExamsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'exams': instance.exams,
    };

ExamDataModel _$ExamDataModelFromJson(Map<String, dynamic> json) =>
    ExamDataModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      duration: json['duration'] as num,
      subjectId: json['subject'] as String,
      numberOfQuestions: json['numberOfQuestions'] as num,
      isActive: json['active'] as bool,
    );

Map<String, dynamic> _$ExamDataModelToJson(ExamDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subjectId,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.isActive,
    };
