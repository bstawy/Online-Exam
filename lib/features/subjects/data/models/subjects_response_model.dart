import '../../domain/entities/subject_entity.dart';
import 'metadata_model.dart';

class SubjectsResponseModel {
  String? message;
  MetadataModel? metadata;
  List<SubjectDataModel>? subjects;

  SubjectsResponseModel({
    this.message,
    this.metadata,
    this.subjects,
  });

  SubjectsResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    metadata = json['metadata'] != null
        ? MetadataModel.fromJson(json['metadata'])
        : null;
    if (json['subjects'] != null) {
      subjects = (json['subjects'] as List)
          .map((e) => SubjectDataModel.fromJson(e))
          .toList();
    }
  }
}

class SubjectDataModel {
  String? id;
  String? name;
  String? iconUrl;

  SubjectDataModel({
    this.id,
    this.name,
    this.iconUrl,
  });

  SubjectDataModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    iconUrl = json['icon'];
  }

  Subject toEntity() {
    return Subject(
      id: id,
      name: name,
      iconUrl: iconUrl,
    );
  }
}
