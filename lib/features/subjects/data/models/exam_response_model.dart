import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/exam_entity.dart';

part 'exam_response_model.g.dart';

@JsonSerializable()
class ExamResponseModel {
  @JsonKey(name: '_id')
  final String id;
  final String level;
  @JsonKey(name: 'questions_count')
  final int questionCount;
  @JsonKey(name: 'from_time')
  final double fromTime;
  @JsonKey(name: 'to_time')
  final double toTime;
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;

  const ExamResponseModel({
    required this.id,
    required this.level,
    required this.questionCount,
    required this.fromTime,
    required this.toTime,
    required this.durationMinutes,
  });

  factory ExamResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseModelToJson(this);

  Exam toEntity() => Exam(
        id: id,
        level: level,
        questionCount: questionCount,
        fromTime: fromTime,
        toTime: toTime,
        durationMinutes: durationMinutes,
      );
}
