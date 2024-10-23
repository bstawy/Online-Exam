class MetadataModel {
  num? currentPage;
  num? numberOfPages;
  num? limit;

  MetadataModel({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  MetadataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
