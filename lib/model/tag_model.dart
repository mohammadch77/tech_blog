class TagsModel {
  String? id;
  String? tittle;

  TagsModel({
    required this.id,
    required this.tittle,
  });
  TagsModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    tittle = element["title"];
  }
}
