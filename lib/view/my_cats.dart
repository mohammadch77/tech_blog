import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_string.dart';
import 'package:tec_blog/model/fake_data.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Image.asset(
                  "assets/images/bot.jpg",
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  MyStrings.successfulText,
                  style: textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: SolidColors.primeryColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    hintText: "نام و نام خانوادگی",
                    hintStyle: textTheme.headline5,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  MyStrings.chooseCats,
                  style: textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                //TagGridview
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                              childAspectRatio: 0.3),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTags.contains(tagList[index])) {
                                selectedTags.add(tagList[index]);
                              }
                            });
                          },
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
                                    tagList[index].tittle!,
                                    style: textTheme.headline2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Icon(
                  Icons.arrow_circle_down,
                  size: 40,
                ),
                //selectedTagsGridview
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: selectedTags.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                              childAspectRatio: 0.2),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              color: SolidColors.surfacecolor),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedTags[index].tittle!,
                                  style: textTheme.headline4,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
