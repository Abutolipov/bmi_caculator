import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;
  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int g=0;

  final ChoiceChip3DStyle selectedStyle=ChoiceChip3DStyle(
    topColor: Colors.grey[200]!,
    backColor: Colors.grey,
    borderRadius: BorderRadius.circular(20),
  );

  final ChoiceChip3DStyle unSelected=ChoiceChip3DStyle(
    topColor: Colors.white,
    backColor: Colors.grey[300]!,
    borderRadius: BorderRadius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: EdgeInsets.all(8),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        ChoiceChip3D(
            border: Border.all(color: Colors.green),
            style: g==1?selectedStyle:unSelected,
            onSelected: (){
              setState((){
                g=1;
              });
              widget.onChange(g);
            },
            onUnSelected: (){},
            selected: g==1,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/man.png",width: 50,),
                SizedBox(height: 5,),
                Text("Male"),
              ],
            )
        ) ,
         SizedBox(width: 20,),
         ChoiceChip3D(
           border: Border.all(color: Colors.green),
             style: g==2?selectedStyle:unSelected,
             selected: g==2,
              onSelected: (){
               setState((){
                 g=2;
               });
               widget.onChange(g);
             },
             onUnSelected: (){},
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                Image.asset("assets/images/woman.png",width: 50,),
                SizedBox(height: 5,),
                Text("Female"),
               ],
             )
         )
       ],
     ),
   );
  }
}
