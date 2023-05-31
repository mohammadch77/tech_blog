import 'package:get/get.dart';
import 'package:tec_blog/component/api_constant.dart';
import 'package:tec_blog/model/article_model.dart';
import 'package:tec_blog/services/dio_services.dart';

class ArticleContoroller extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      print(articleList);

      loading.value = false;
    }
  }
}
