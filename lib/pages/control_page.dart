import 'package:appenglish/value/app_colors.dart';
import 'package:flutter/material.dart';

import '../value/app_assets.dart';
import '../value/app_styles.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double sliderValue = 5;

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
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
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
