import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/component/my_string.dart';
import 'package:tec_blog/view/profile_screen.dart';
import 'package:tec_blog/view/register_intro.dart';
import 'home_screen.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPagesIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBg,
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: ListView(children: [
              DrawerHeader(
                child: Center(
                  child: Image.asset(
                    "assets/images/tech_splash.png",
                    scale: 2,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "پروفایل کاربری",
                  style: textTheme.headline4,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.divider,
                thickness: 1,
              ),
              ListTile(
                title: Text(
                  " درباره تک بلاگ",
                  style: textTheme.headline4,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.divider,
                thickness: 1,
              ),
              ListTile(
                title: Text(
                  " اشتراک گذاری تک بلاک",
                  style: textTheme.headline4,
                ),
                onTap: () async {
                  await Share.share(MyStrings.shareText);
                },
              ),
              const Divider(
                color: SolidColors.divider,
                thickness: 1,
              ),
              ListTile(
                title: Text(
                  " تک بلاگ در گیت هاب",
                  style: textTheme.headline4,
                ),
                onTap: () {
                  myLuncherUrl(MyStrings.techBlogUrl);
                },
              ),
              const Divider(
                color: SolidColors.divider,
                thickness: 1,
              ),
            ]),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scafoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Image.asset(
                "assets/images/tech_splash.png",
                height: size.height / 13.6,
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                index: selectedPagesIndex.value,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ProfileScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  const RegisterIntro()
                ],
              ),
            )),
            ButtonNav(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                selectedPagesIndex.value = value;
              },
            )
          ],
        ),
      ),
    );
  }
}

class ButtonNav extends StatelessWidget {
  const ButtonNav({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: GradiangtColors.bottomNAVbg,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding:
              EdgeInsets.only(right: bodyMargin, left: bodyMargin, bottom: 8),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: GradiangtColors.bottomNAV,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    changeScreen(0);
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    changeScreen(2);
                  },
                  icon: const Icon(
                    CupertinoIcons.pencil,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    changeScreen(1);
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
