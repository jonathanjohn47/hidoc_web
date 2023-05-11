import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidoc_web/helpers/date_time_helpers.dart';
import 'package:hidoc_web/models/articles_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sizer/sizer.dart';

import '../get_controllers/dashboard_get_controller.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  DashboardGetController dashboardGetController =
      Get.put(DashboardGetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ArticlesModel>(
          future: dashboardGetController.getArticles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ArticlesModel articleModel = snapshot.data!;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            "Articles",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                        width: 16,
                      ),
                      Card(
                        margin: const EdgeInsets.all(4.0),
                        color: const Color(0xffe0e0e0),
                        shadowColor: const Color(0xff000000),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: const BorderSide(color: Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Container(
                            width: 40.w,
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: "Critical Care",
                                items: [
                                  "Critical Care"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                style: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                onChanged: (value) {},
                                elevation: 8,
                                isExpanded: true,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 85.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image(
                                    image: NetworkImage(
                                        articleModel.data.article.articleImg),
                                    height: 20.w,
                                    width: 20.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff2dc4d8),
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(4.0)),
                                    border: Border.all(
                                        color: const Color(0x4d9e9e9e), width: 1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      SizedBox(
                                        height: 8,
                                        width: 16,
                                      ),
                                      Text(
                                        "Points",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                      Text(
                                        "2",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                              width: 5.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    articleModel.data.article.articleTitle,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                    width: 16,
                                  ),
                                  Text(
                                    articleModel
                                        .data.article.articleDescription,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                    width: 16,
                                  ),
                                  const Text(
                                    "Read full article to earn  points ",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                      color: Color(0xff2dc4d8),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                    width: 16,
                                  ),
                                  Text(
                                    "Published Date: ${articleModel.data.article.createdAt!.getDateWithMonthName}",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                      color: Color(0xff808080),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                        width: 16,
                      ),
                      Divider(
                        indent: 3.w,
                        endIndent: 3.w,
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 85.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: const [
                                      Text(
                                        "Hidoc Bulletin",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: false,
                                      physics: const ScrollPhysics(),
                                      children: [
                                        ...articleModel.data.bulletin
                                            .map(
                                              (e) => Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const SizedBox(
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.zero,
                                                    padding: EdgeInsets.zero,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    height: 8,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xff2dc4d8),
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  Text(
                                                    e.articleTitle,
                                                    textAlign: TextAlign.start,
                                                    overflow: TextOverflow.clip,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  Text(
                                                    e.articleDescription,
                                                    textAlign: TextAlign.start,
                                                    overflow: TextOverflow.clip,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  const Text(
                                                    "Read More...",
                                                    textAlign: TextAlign.start,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12,
                                                      color: Color(0xff2dc4d8),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                ],
                                              ),
                                            )
                                            .toList()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                              width: 8,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.zero,
                                padding: const EdgeInsets.all(8),
                                width: 85.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xffd8ecf0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                      color: const Color(0xffd8ecf0), width: 1),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Text(
                                          "Trending Hidoc Bulletin",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                      width: 16,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: ListView(
                                        scrollDirection: Axis.vertical,
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: false,
                                        physics: const ScrollPhysics(),
                                        children: [
                                          ...articleModel.data.trandingBulletin
                                              .map(
                                                (e) => Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      e.articleTitle,
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                    Text(
                                                      e.articleDescription,
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                    const Text(
                                                      "Read More...",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff2dc4d8),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 85.w,
                        child: Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Color(0xfff4f4f4),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.zero,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {},
                                      color: const Color(0xff2dc4d8),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: const BorderSide(
                                            color: Color(0xff2dc4d8), width: 0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      height: 40,
                                      minWidth: 140,
                                      child: const Text(
                                        "Read More Bulletins",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                  width: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        width: 30.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          color: const Color(0x00000000),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.zero,
                                          border: Border.all(
                                              color: const Color(0x4d9e9e9e),
                                              width: 1),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(
                                              height: 16,
                                              width: 16,
                                            ),
                                            const Text(
                                              "Latest Articles",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                              width: 16,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: ListView(
                                                scrollDirection: Axis.vertical,
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: false,
                                                physics: const ScrollPhysics(),
                                                children: [
                                                  ...articleModel
                                                      .data.latestArticle
                                                      .map(
                                                        (e) => Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            const Divider(
                                                              color: Color(
                                                                  0xff808080),
                                                              height: 16,
                                                              thickness: 1,
                                                              indent: 0,
                                                              endIndent: 0,
                                                            ),
                                                            Text(
                                                              e.articleTitle,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xff000000),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                      .toList()
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                      width: 16,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        width: 30.h,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          color: const Color(0x00000000),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.zero,
                                          border: Border.all(
                                              color: const Color(0x4d9e9e9e),
                                              width: 1),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Text(
                                              "Trending Articles",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                              width: 16,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: ListView(
                                                scrollDirection: Axis.vertical,
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: false,
                                                physics: const ScrollPhysics(),
                                                children: [
                                                  ...articleModel
                                                      .data.trandingArticle
                                                      .map(
                                                        (e) => Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            const Divider(
                                                              color: Color(
                                                                  0xff808080),
                                                              height: 16,
                                                              thickness: 1,
                                                              indent: 0,
                                                              endIndent: 0,
                                                            ),
                                                            Image(
                                                              image: NetworkImage(
                                                                  e.articleImg),
                                                              height: 100,
                                                              width: 140,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Text(
                                                              e.articleTitle,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xff000000),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                      .toList()
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                      width: 16,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.zero,
                                            padding: EdgeInsets.zero,
                                            width: 30.w,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                              color: const Color(0x00000000),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.zero,
                                              border: Border.all(
                                                  color: const Color(0x4d9e9e9e),
                                                  width: 1),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                const Text(
                                                  "Explore more in Articles",
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: ListView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: false,
                                                    physics: const ScrollPhysics(),
                                                    children: [
                                                      ...articleModel
                                                          .data.exploreArticle
                                                          .map(
                                                            (e) => Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                const Divider(
                                                                  color: Color(
                                                                      0xff808080),
                                                                  height: 16,
                                                                  thickness: 0,
                                                                  indent: 0,
                                                                  endIndent: 0,
                                                                ),
                                                                Text(
                                                                  e.articleTitle,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .clip,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                        0xff000000),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                          .toList()
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                            width: 16,
                                          ),
                                          MaterialButton(
                                            onPressed: () {},
                                            color: const Color(0xff2dc4d8),
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              side: const BorderSide(
                                                  color: Color(0xff2dc4d8),
                                                  width: 1),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 8),
                                            textColor: Colors.white,
                                            height: 40,
                                            minWidth: 140,
                                            child: const Text(
                                              "Explore Hidoc Dr.",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 85.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              "Whats more on Hidoc Dr.",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                color: Color(0xff000000),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                              width: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: CarouselSlider(
                                    items: [
                                      ...articleModel.data.news
                                          .map((e) => Container(
                                                margin: EdgeInsets.zero,
                                                padding: EdgeInsets.zero,
                                                width: 200,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xfff4f4f4),
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                  border: Border.all(
                                                      color: const Color(0x4d9e9e9e),
                                                      width: 1),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            const Text(
                                                              "News",
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xff000000),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            Text(
                                                              e.title,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xff000000),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                    Image(
                                                      image: NetworkImage(
                                                          e.urlToImage),
                                                      height: 100,
                                                      width: 140,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList()
                                    ],
                                    options: CarouselOptions(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                  width: 16,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.zero,
                                    padding: EdgeInsets.zero,
                                    decoration: const BoxDecoration(
                                      color: Color(0x00000000),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.zero,
                                              padding: EdgeInsets.zero,
                                              width: 40,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                color: Color(0xffe3f1fd),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                MdiIcons.trophy,
                                                color: Color(0xff2398f4),
                                                size: 24,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                              width: 16,
                                            ),
                                            const Text(
                                              "Quizzes:",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                              width: 16,
                                            ),
                                            const Expanded(
                                              child: Text(
                                                "Participate and win exciting prizes",
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          color: Color(0xff808080),
                                          height: 16,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.zero,
                                              padding: EdgeInsets.zero,
                                              width: 40,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                color: Color(0xffe3f1fd),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.calculate,
                                                color: Color(0xff2398f4),
                                                size: 24,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                              width: 16,
                                            ),
                                            const Text(
                                              "Medical Calculators:",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                              width: 16,
                                            ),
                                            const Expanded(
                                              child: Text(
                                                "Get access to 800+ evidence based calculators",
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                              width: 16,
                            ),
                            Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xffcbf2f6),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.zero,
                                border: Border.all(
                                    color: const Color(0x4d9e9e9e), width: 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Social Network for doctors - A special feature on Hidoc Dr.",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                      width: 16,
                                    ),
                                    Chip(
                                      labelPadding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 0),
                                      label: const Text("Visit"),
                                      labelStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xffffffff),
                                      ),
                                      backgroundColor: const Color(0xff00bcd4),
                                      elevation: 4,
                                      shadowColor: const Color(0xff808080),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                        width: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: const Color(0xff081734),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.zero,
                              border: Border.all(
                                  color: const Color(0xff081734), width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        const Image(
                                          image: AssetImage(
                                              "assets/images/Screenshot 2023-05-11 at 9.52.57 AM.png"),
                                          height: 100,
                                          width: 140,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            "#1 Medical app in India for doctors with 800K Monthly Users",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                          width: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: const [
                                            Icon(
                                              MdiIcons.facebook,
                                              color: Color(0xffffffff),
                                              size: 24,
                                            ),
                                            Icon(
                                              MdiIcons.linkedin,
                                              color: Color(0xffffffff),
                                              size: 24,
                                            ),
                                            Icon(
                                              MdiIcons.instagram,
                                              color: Color(0xffffffff),
                                              size: 24,
                                            ),
                                            Icon(
                                              MdiIcons.youtube,
                                              color: Color(0xffffffff),
                                              size: 24,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                    width: 16,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Text(
                                          "Reach Us",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                          width: 16,
                                        ),
                                        Text(
                                          "Please contact below details for any other information. ",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                          width: 16,
                                        ),
                                        Text(
                                          "Email",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color(0xff00bcd4),
                                          ),
                                        ),
                                        Text(
                                          "info@hidoc.co",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                          width: 16,
                                        ),
                                        Text(
                                          "Address",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color(0xff00bcd4),
                                          ),
                                        ),
                                        Text(
                                          "Infedis Infotech LLP, Office 108, Suyog Center, Gultekdi, Pune- 411 037, Toll Free : 1800-202-5091 ",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                    width: 16,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Text(
                                          "Hidoc Dr. Features",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18,
                                            color: Color(0xffffffff),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 16,
                                          width: 16,
                                        ),

                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                        Image(
                                          image: AssetImage(
                                              "assets/images/Screenshot 2023-05-11 at 10.03.48 AM.png"),
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            width: 100.w,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xffcfd8db),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.zero,
                              border: Border.all(
                                  color: const Color(0x4d9e9e9e), width: 1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Text(
                                      "© Copyright 2022",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                      width: 16,
                                    ),
                                    Text(
                                      "Infedis infotech LLP",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Terms and Conditions | Privacy Policy",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
