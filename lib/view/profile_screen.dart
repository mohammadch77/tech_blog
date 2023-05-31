import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/component/my_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/profile_image.png",
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.pen,
                    color: SolidColors.seeMore,
                    size: 26,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    MyStrings.imageProfileEdit,
                    style: textTheme.headline3,
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "محمد چوگانیان",
                style: textTheme.headline4,
              ),
              Text(
                "choganian.mohammad@gmail",
                style: textTheme.headline4,
              ),
              const SizedBox(
                height: 40,
              ),
              TecDivider(size: size),
              InkWell(
                onTap: () {},
                splashColor: SolidColors.primeryColor,
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      MyStrings.myFavBlog,
                      style: textTheme.headline4,
                    ),
                  ),
                ),
              ),
              TecDivider(size: size),
              InkWell(
                onTap: () {},
                splashColor: SolidColors.primeryColor,
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      MyStrings.myFavPod,
                      style: textTheme.headline4,
                    ),
                  ),
                ),
              ),
              TecDivider(size: size),
              InkWell(
                onTap: () {},
                splashColor: SolidColors.primeryColor,
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      MyStrings.logOut,
                      style: textTheme.headline4,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ));
  }
}
