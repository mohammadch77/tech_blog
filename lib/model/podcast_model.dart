import 'package:tec_blog/component/api_constant.dart';

class PodcastsModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? veiw;
  String? createdAt;
  PodcastsModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.veiw,
    required this.createdAt,
  });
  PodcastsModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = ApiConstant.hostDlUrl + element["poster"];
    publisher = element["publisher"];
    veiw = element["veiw"];
    createdAt = element["created_at"];
  }
}
