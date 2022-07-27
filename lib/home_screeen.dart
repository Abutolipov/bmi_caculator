import 'dart:math';

import 'package:bmi_caculator/age_weight_widget.dart';
import 'package:bmi_caculator/gender_widget.dart';
import 'package:bmi_caculator/height_widget.dart';
import 'package:bmi_caculator/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomeSceenState extends StatefulWidget {
  const HomeSceenState({Key? key}) : super(key: key);

  @override
  State<HomeSceenState> createState() => _HomeSceenStateState();
}

class _HomeSceenStateState extends State<HomeSceenState> {
  int g=0;
  int h=150;
  int _age=30;
  int weigth=50;
  bool isFinished=false;
  double _bmiScore=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(),
            child: Column(
              children: [
                GenderWidget(
                  //onChange deb widgetlarni ozgargan qiymatlarni ovolyapmz
                    onChange:(genderVal){
                      g=genderVal;
                    }
                ),
                HeightWidget(onChange: (v){
                  h=v;
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeWeigth(onChange: (ageValue){
                      _age=ageValue;
                    }, title: "Age",
                        initValue:30,
                        min: 0,
                        max: 100
                    ),
                    AgeWeigth(onChange: (weigth){
                      weigth=weigth;
                    }, title: "Weigth(kg)", initValue: 50, min: 0, max: 240),
                    ]),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 60,

                      ),
                      child: SwipeableButtonView(
                        isFinished:isFinished,
                        onFinish: ()async{
                          await Navigator.push(context,
                              PageTransition(
                                  child:ScoreSceen(_bmiScore,_age),
                                  type: PageTransitionType.fade
                              ),
                          );
                          setState((){
                            isFinished=false;
                          });
                        },
                        onWaitingProcess: (){
                          calculatBMI();
                          Future.delayed(Duration(seconds: 1),(){
                            setState((){
                              isFinished=true;
                            });
                          });
                        },
                        activeColor: Colors.green,
                        buttonWidget: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText: "Calculate",
                      ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void calculatBMI(){
    _bmiScore=weigth/pow(h/100, 2);
  }
}
