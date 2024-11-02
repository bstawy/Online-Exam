import 'package:json_annotation/json_annotation.dart';

part 'metadata_model.g.dart';

@JsonSerializable()
class MetadataModel {
  num? currentPage;
  num? numberOfPages;
  num? limit;

  MetadataModel({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory MetadataModel.fromJson(Map<String, dynamic> json) =>
      _$MetadataModelFromJson(json);
}
