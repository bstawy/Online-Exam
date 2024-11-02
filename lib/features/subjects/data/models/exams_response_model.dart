import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/exam_entity.dart';
import 'metadata_model.dart';

part 'exams_response_model.g.dart';

@JsonSerializable()
class ExamsResponseModel {
  final String message;
  final MetadataModel? metadata;
  final List<ExamDataModel> exams;

  ExamsResponseModel({
    required this.message,
    this.metadata,
    required this.exams,
  });

  factory ExamsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExamsResponseModelFromJson(json);
}

@JsonSerializable()
class ExamDataModel {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final num duration;
  @JsonKey(name: 'subject')
  final String subjectId;
  final num numberOfQuestions;
  @JsonKey(name: 'active')
  final bool isActive;

  const ExamDataModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.subjectId,
    required this.numberOfQuestions,
    required this.isActive,
  });

  factory ExamDataModel.fromJson(Map<String, dynamic> json) =>
      _$ExamDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDataModelToJson(this);

  Exam toEntity() => Exam(
        id: id,
        title: title,
        duration: duration,
        subjectId: subjectId,
        numberOfQuestions: numberOfQuestions,
        isActive: isActive,
      );
}
