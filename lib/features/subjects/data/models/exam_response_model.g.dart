// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResponseModel _$ExamResponseModelFromJson(Map<String, dynamic> json) =>
    ExamResponseModel(
      id: json['_id'] as String,
      level: json['level'] as String,
      questionCount: (json['questions_count'] as num).toInt(),
      fromTime: (json['from_time'] as num).toDouble(),
      toTime: (json['to_time'] as num).toDouble(),
      durationMinutes: (json['duration_minutes'] as num).toInt(),
    );

Map<String, dynamic> _$ExamResponseModelToJson(ExamResponseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'level': instance.level,
      'questions_count': instance.questionCount,
      'from_time': instance.fromTime,
      'to_time': instance.toTime,
      'duration_minutes': instance.durationMinutes,
    };
