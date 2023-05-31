import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/view/article_list_screen.dart';
import 'package:tec_blog/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBar,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa', ''), //farsi
        ],
        theme: ThemeData(
            fontFamily: "bnazanin",
            textTheme: const TextTheme(
              headline1: TextStyle(
                  fontFamily: "bnazanin",
                  fontWeight: FontWeight.w700,
                  color: SolidColors.posterTittle,
                  fontSize: 16),
              subtitle1: TextStyle(
                  fontFamily: "bnazanin",
                  fontWeight: FontWeight.w300,
                  color: SolidColors.posterSubTittle,
                  fontSize: 14),
              headline3: TextStyle(
                  fontFamily: "bnazanin",
                  fontWeight: FontWeight.w700,
                  color: SolidColors.seeMore,
                  fontSize: 16),
              headline4: TextStyle(
                  fontFamily: "bnazanin",
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 16),
              bodyText1: TextStyle(
                  fontFamily: "bnazanin",
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 13),
              headline2: TextStyle(
                  fontFamily: "bnazanin",
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 14),
              headline5: TextStyle(
                  fontFamily: "bnazanin",
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 133, 133, 133),
                  fontSize: 14),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(textStyle: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return textTheme.headline1;
                  }
                  return textTheme.subtitle1;
                },
              ), backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return SolidColors.seeMore;
                }
                return SolidColors.primeryColor;
              })),
            )),
        home: ArticleListScreen());
  }
}
