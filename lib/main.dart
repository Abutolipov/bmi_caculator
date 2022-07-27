import 'package:bmi_caculator/home_screeen.dart';
import 'package:flutter/material.dart';

import 'age_weight_widget.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeSceenState(),
    );
  }
}
