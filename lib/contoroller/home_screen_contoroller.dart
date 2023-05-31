import 'package:get/get.dart';
import 'package:tec_blog/component/api_constant.dart';
import 'package:tec_blog/model/article_model.dart';
import 'package:tec_blog/model/podcast_model.dart';
import 'package:tec_blog/model/poster_model.dart';
import 'package:tec_blog/model/tag_model.dart';
import 'package:tec_blog/services/dio_services.dart';

class HomeScreenContoroller extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastsModel> topPodcastList = RxList();
  RxList<TagsModel> tagList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItem();
  }

  getHomeItem() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
      response.data['top_podcasts'];
      //print(response.data['top_podcasts']);
      for (int i = 3; i < response.data['top_podcasts'].length; i++) {
        //var element = topPodcasts[i];
        //print(response.data['top_podcasts'][i]);
        topPodcastList
            .add(PodcastsModel.fromJson(response.data['top_podcasts'][i]));
      }

      poster.value = PosterModel.fromJson(response.data['poster']);
      response.data['tags'].forEach((element) {
        tagList.add(TagsModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}

/*     response.data['poster'];
    response.data['tags'];  */
   /*   response.data['top_podcasts'].forEach((element) {
        topPodcastList.add(PodcastsModel.fromJson(element));
      }); */