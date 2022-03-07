import 'package:appenglish/value/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../value/app_assets.dart';
import '../value/app_styles.dart';
import '../value/share_key.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double sliderValue = 5;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initDefaultValue();
  }

  initDefaultValue() async {
    prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(ShareKeys.counter) ?? 5;
    setState(() {
      sliderValue = value.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secondColor,
        title: Text(
          'Your Control',
          style: AppStyles.h2.copyWith(fontSize: 40, color: Colors.black),
        ),
        leading: InkWell(
          //???
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt(ShareKeys.counter, sliderValue.toInt());
            // ignore: avoid_print
            print('Gia tri slider: $sliderValue');
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Text("How much a number word at onve?",
                style: AppStyles.h4.copyWith(
                  color: AppColors.lightGrey,
                  fontSize: 18,
                )),
            Spacer(),
            Text('${sliderValue.toInt()}',
                style: AppStyles.h1.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                )),
            Slider(
                value: sliderValue,
                min: 5,
                max: 100,
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.primaryColor,
                divisions: 95,
                onChanged: (value) {
                  // ignore: avoid_print
                  print(value);
                  setState(() {
                    sliderValue = value;
                  });
                }),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text("Slide to set",
                  style: AppStyles.h5.copyWith(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
