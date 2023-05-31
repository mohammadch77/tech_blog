import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TecDivider extends StatelessWidget {
  const TecDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.divider,
      indent: size.width / 6,
      endIndent: size.width / 6,
      thickness: 1.5,
    );
  }
}

myLuncherUrl(String url) async {
  await launchUrl(Uri.parse(url));
}

class loading extends StatelessWidget {
  const loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primeryColor,
      size: 32,
    );
  }
}

TextStyle appBarTextStyle = const TextStyle(
    fontFamily: "bnazanin",
    fontWeight: FontWeight.w300,
    color: SolidColors.primeryColor,
    fontSize: 16);
PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: SolidColors.scafoldBg,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
              child: Text(title, style: appBarTextStyle),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: SolidColors.primeryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.keyboard_arrow_right_rounded),
          ),
        ),
      ),
    ),
  );
}
