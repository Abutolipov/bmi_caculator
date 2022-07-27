import 'package:flutter/material.dart';

class AgeWeigth extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;
//kutbxonani birinchi chqairib keyn qoshamza
  const AgeWeigth({Key? key, required this.onChange, required this.title, required this.initValue, required this.min, required this.max}) : super(key: key);

  @override
  State<AgeWeigth> createState() => _AgeWeigthState();
}

class _AgeWeigthState extends State<AgeWeigth> {
  int counter=0;

  void initState(){
    super.initState();
    counter=widget.initValue;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title,style: TextStyle(color: Colors.green,fontSize: 22),),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.remove,color: Colors.white,),
                  ),
                  onTap: (){
                    setState((){
                      if(counter>widget.min){
                        counter--;
                      }
                    });
                    widget.onChange(counter);
                  },
                ),
                SizedBox(width: 15,),
                Text(counter.toString()),
                SizedBox(width: 15,),
                InkWell(
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.add,color: Colors.white,),
                  ),
                  onTap: (){
                    setState((){
                      if(counter<widget.max){
                        counter++;
                      }
                    });
                    widget.onChange(counter);
                  },
                ),
                SizedBox(height: 35,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
