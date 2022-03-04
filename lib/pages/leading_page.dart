// ignore_for_file: avoid_unnecessary_containers
import 'package:appenglish/pages/home_page.dart';
import 'package:appenglish/value/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:appenglish/value/app_styles.dart';
import 'package:appenglish/value/app_colors.dart';

//
class LeadingPage extends StatelessWidget {
  const LeadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              //color: Colors.red,
              child: Text(
                "Welcome to",
                style: AppStyles.h3,
              ),
            )),
            Expanded(
                child: Container(
              //color: Colors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "English",
                    style: AppStyles.h2.copyWith(
                        color: AppColors.blackGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      'Qoutes"',
                      textAlign: TextAlign.right,
                      style: AppStyles.h4.copyWith(height: 0.5),
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                        (route) => false);
                  },
                  fillColor: AppColors.lighBlue,
                  shape: CircleBorder(),
                  child: Image.asset(AppAssets.rightArrow),
                ),
                // child: FloatingActionButton(
                //   onPressed: () {},
                //   focusColor: Colors.amber,
                //   child: Image.asset(AppAssets.rightArrow),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
