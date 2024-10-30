import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/subject_entity.dart';
import 'metadata_model.dart';

@JsonSerializable()
class SubjectsResponseModel {
  final String message;
  final MetadataModel? metadata;
  final List<SubjectDataModel> subjects;

  SubjectsResponseModel({
    required this.message,
    this.metadata,
    required this.subjects,
  });

  factory SubjectsResponseModel.fromJson(Map<String, dynamic> json) {
    return SubjectsResponseModel(
      message: json['message'] as String? ?? '',
      metadata: json['metadata'] != null
          ? MetadataModel.fromJson(json['metadata'])
          : null,
      subjects: (json['subjects'] as List)
          .map((e) => SubjectDataModel.fromJson(e))
          .toList(),
    );
  }
}

@JsonSerializable()
class SubjectDataModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  @JsonKey(name: 'icon')
  final String? iconUrl;

  SubjectDataModel({
    required this.id,
    required this.name,
    this.iconUrl,
  });

  factory SubjectDataModel.fromJson(Map<String, dynamic> json) {
    return SubjectDataModel(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      iconUrl: json['icon'] as String?,
    );
  }

  Subject toEntity() {
    return Subject(
      id: id,
      name: name,
      iconUrl: iconUrl,
    );
  }
}