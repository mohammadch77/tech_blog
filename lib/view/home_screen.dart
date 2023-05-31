import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/component/my_string.dart';
import 'package:tec_blog/contoroller/home_screen_contoroller.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  HomeScreenContoroller homeScreenContoroller =
      Get.put(HomeScreenContoroller());
  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 16),
          child: homeScreenContoroller.loading.value == false
              ? Column(
                  children: [
                    poster(),
                    const SizedBox(
                      height: 16,
                    ),
                    //tagList
                    tagsList(),
                    const SizedBox(
                      height: 32,
                    ),
                    //see more of blogList
                    SeeMoreBlogLIst(
                        bodyMargin: bodyMargin, textTheme: textTheme),
                    //blogList
                    topVisitedList(),
                    //see more of podList
                    SeeMorePodList(
                        bodyMargin: bodyMargin, textTheme: textTheme),
                    //podList
                    topPodcastsList(),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                )
              : const loading(),
        ),
      ),
    );
  }

  Widget topVisitedList() {
    return SizedBox(
      height: size.height / 3,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenContoroller.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? bodyMargin : 15, top: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.2,
                    width: size.width / 2.4,
                    child: Stack(
                      children: [
                        Container(
                          foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            gradient: LinearGradient(
                              colors: GradiangtColors.blogPost,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: homeScreenContoroller
                                .topVisitedList[index].image!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              );
                            },
                            placeholder: (context, url) {
                              return const loading();
                            },
                            errorWidget: (context, url, error) {
                              return const Icon(
                                Icons.image_not_supported_outlined,
                                color: Colors.grey,
                                size: 50,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                homeScreenContoroller
                                    .topVisitedList[index].author!,
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homeScreenContoroller
                                        .topVisitedList[index].view!,
                                    style: textTheme.subtitle1,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      homeScreenContoroller.topVisitedList[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topPodcastsList() {
    return SizedBox(
      height: size.height / 3,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenContoroller.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? bodyMargin : 15, top: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.2,
                      width: size.width / 2.4,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenContoroller.topPodcastList[index].poster!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          );
                        },
                        placeholder: (context, url) {
                          return const loading();
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 50,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      homeScreenContoroller.topPodcastList[index].title!,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        //home poster
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              colors: GradiangtColors.homePosterCoverGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: homeScreenContoroller.poster.value.image!,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              );
            },
            placeholder: (context, url) {
              return const loading();
            },
            errorWidget: (context, url, error) {
              return const Icon(
                Icons.image_not_supported_outlined,
                color: Colors.grey,
                size: 50,
              );
            },
          ),
        ),
        Positioned(
          bottom: 8,
          right: 0,
          left: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                homeScreenContoroller.poster.value.title!,
                style: textTheme.headline1,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget tagsList() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: homeScreenContoroller.tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                  gradient: LinearGradient(
                      colors: GradiangtColors.tags,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.tag,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      homeScreenContoroller.tagList[index].tittle!,
                      style: textTheme.headline2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SeeMorePodList extends StatelessWidget {
  const SeeMorePodList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: Row(
        children: [
          const Icon(
            Icons.mic_rounded,
            color: SolidColors.seeMore,
            size: 26,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            MyStrings.viewHotestPodcast,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class SeeMoreBlogLIst extends StatelessWidget {
  const SeeMoreBlogLIst({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.pen,
            color: SolidColors.seeMore,
            size: 26,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            MyStrings.viewHotestblog,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
