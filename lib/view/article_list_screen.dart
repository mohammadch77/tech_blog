import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/contoroller/article_contoroller.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  ArticleContoroller articleContoroller = Get.put(ArticleContoroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar("مقالات جدید"),
      body: Obx(
        () => SizedBox(
          child: ListView.builder(
            itemCount: articleContoroller.articleList.length,
            itemBuilder: (context, index) {
              return Text(articleContoroller.articleList[index].title!);
            },
          ),
        ),
      ),
    ));
  }
}
