// ignore: avoid_unnecessary_containers
// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:appenglish/packages/qoute_model.dart';
import 'package:appenglish/packages/quote.dart';
import 'package:appenglish/pages/control_page.dart';
import 'package:appenglish/value/app_assets.dart';
import 'package:appenglish/value/app_colors.dart';
import 'package:appenglish/value/app_styles.dart';
import 'package:appenglish/value/share_key.dart';
import 'package:appenglish/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:appenglish/models/englishtoday.dart';
import 'package:english_words/english_words.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:appenglish/widgets/app_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curentIndex = 0;
  late PageController _pageController;

  List<EnglishToday> words = [];

  List<int> fixedListRamdom({int len = 1, int max = 120, int min = 1}) {
    if (len > max || len < min) {
      return [];
    }
    List<int> newList = [];

    Random random = Random();
    int count = 1;
    while (count <= len) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  getEnglishToday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int len = prefs.getInt(ShareKeys.counter) ?? 5;
    // //////
    // // ignore: avoid_print
    // print('Gia tri cua len: $len');
    List<String> newList = [];
    List<int> rans = fixedListRamdom(len: len, max: nouns.length);
    // ignore: avoid_function_literals_in_foreach_calls
    rans.forEach((index) {
      newList.add(nouns[index]);
    });
    setState(() {
      words = newList.map((e) => getQuote(e)).toList();
    });
  }

  EnglishToday getQuote(String noun) {
    Quote? quote;
    quote = Quotes().getByWord(noun);
    return EnglishToday(
      noun: noun,
      quote: quote?.content,
      id: quote?.id,
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.9,
    );

    super.initState();
    getEnglishToday();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secondColor,
        title: Text(
          'English Today',
          style: AppStyles.h2.copyWith(fontSize: 40, color: Colors.black),
        ),
        leading: InkWell(
          //???
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
            // ignore: avoid_print
            //print("Minh ten la Nhon");
          },
          child: Image.asset(AppAssets.menu),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        //color: Colors.red,
        //padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Container(
            height: size.height * 1 / 10,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(16),
            child: Text(
              '"It is amazing how complete is the delusion that beaty is goodness"',
              style: AppStyles.h5
                  .copyWith(fontSize: 12, color: AppColors.textColor),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: size.height * 2 / 3,
            //color: Colors.black,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _curentIndex = index;
                  // ignore: avoid_print
                  print('Gia tri: $index');
                });
              },
              //???
              itemCount: words.length,
              itemBuilder: (BuildContext context, int index) {
                String fristLetter =
                    words[index].noun != null ? words[index].noun! : " ";
                //if words.. khac1 null thi lay words[index].noun! : '';

                fristLetter = fristLetter.substring(0, 1);

                String leftLetter =
                    words[index].noun != null ? words[index].noun! : "";
                leftLetter = leftLetter.substring(1, leftLetter.length);

                String quoteDefault =
                    "Think of all the beauty still left around you and be happy";

                String qoute = words[index].quote != null
                    ? words[index].quote!
                    : quoteDefault;

                return Container(
                  //padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(3, 6),
                          blurRadius: 6),
                    ],
                  ),

                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            child: Image.asset(AppAssets.heart)),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          //alignment: Alignment.centerLeft,
                          child: RichText(
                              maxLines: 1, //???

                              ///?????
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start, //????
                              text: TextSpan(
                                  text: fristLetter.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: FontFamily.sen,
                                      fontSize: 90,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(3, 6),
                                        )
                                      ]),
                                  children: [
                                    TextSpan(
                                      text: leftLetter,
                                      style: TextStyle(
                                          fontFamily: FontFamily.sen,
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(3, 6),
                                            )
                                          ]),
                                    ),
                                  ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: AutoSizeText(
                            '"$qoute"',
                            style: AppStyles.h4.copyWith(
                              letterSpacing: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: size.height * 1 / 30,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    // ignore: avoid_print
                    return BuildIndicator(index == _curentIndex, size);
                  }),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          setState(() {
             getEnglishToday();
          });
        },
        child: Image.asset(AppAssets.exchange),
      ),
      drawer: Drawer(
        child: Container(
          color: AppColors.lighBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16),
                child: Text('Your mind',
                    style: AppStyles.h3.copyWith(color: AppColors.textColor)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: AppButton(
                    label: 'Favorites',
                    onTap: () {
                      // ignore: avoid_print
                      print('Favori');
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: AppButton(
                    label: 'Your Control',
                    onTap: () {
                      // ignore: avoid_print
                      print('Favori');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ControlPage()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildIndicator(bool isActive, Size size) {
    return Container(
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: isActive ? size.width * 1 / 4 : 24, //????
      decoration: BoxDecoration(
          color: isActive ? AppColors.lighBlue : AppColors.lightGrey, //???
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2, 3),
              blurRadius: 3,
            ),
          ]),
    );
  }
}
