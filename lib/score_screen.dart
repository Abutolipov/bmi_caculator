import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreSceen extends StatelessWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiInterpetation;
  Color?  bmiStatuColor;
  ScoreSceen( this.bmiScore, this.age, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInter();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Text("Your Score",style: TextStyle(fontSize: 30,color: Colors.blue),),
             const SizedBox(height: 10,),
             PrettyGauge(
               gaugeSize: 360,
               minValue: 0,
               maxValue: 40,
               segments: [
                 GaugeSegment("UnderWeigth", 18.5, Colors.red),
                 GaugeSegment("Normal", 6.4, Colors.green),
                 GaugeSegment("UnderWeigth", 5, Colors.orange),
                 GaugeSegment("Obese", 10.1, Colors.pink),
               ],
               valueWidget: Text(
                 bmiScore.toStringAsFixed(1),
                 style: TextStyle(fontSize: 40),
               ),
               currentValue:bmiScore.toDouble(),
               needleColor: Colors.blue,
             ) ,
              const SizedBox(height: 10,),
              Text(bmiStatus!,style: TextStyle(fontSize: 20,color: bmiStatuColor!),),
              const SizedBox(height: 10,),
              Text(bmiInterpetation!,style: TextStyle(fontSize: 20,color:Colors.black),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Re-calculte",style:TextStyle(color: Colors.white),),
                  ),
                  SizedBox(width: 11,),
                  ElevatedButton(
                    onPressed: (){
                      Share.share(
                       "Your Score is ${bmiScore.toStringAsFixed(1)} at age $age"
                      );
                    },
                    child: Text("Share",style:TextStyle(color: Colors.white),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
  void setBmiInter(){
   if(bmiScore>30){
     bmiStatus="Obese";
     bmiInterpetation="Please work to resduce obisty";
     bmiStatuColor=Colors.pink;
   }else if(bmiScore>=25){
     bmiStatus="OverWeigth";
     bmiInterpetation="Do redular exercise";
     bmiStatuColor=Colors.orange;
   }else if(bmiScore>=18.6){
     bmiStatus="Normal";
     bmiInterpetation="Enjoy Your fit";
     bmiStatuColor=Colors.green;
   }else if(bmiScore<18.5){
     bmiStatuColor=Colors.red;
     bmiInterpetation="Try to increase Weight";
     bmiStatus="Under Weigth";
   }
  }
}


