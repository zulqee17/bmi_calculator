import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusablebutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.Result,required this.rText,required this.rInteroretation});

  final String Result;
  final String rText;
  final String rInteroretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 15,top: 15),
              child: Text("Your Result",style: kTitleStyle,),
            ),
          ),),
          Expanded(
              flex: 5,
              child: ReusableCard(color: kactiveCardColor,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(rText.toUpperCase(),style: kRStyle,),
                  Text(Result,style: kResultStyle,),
                  Text(rInteroretation,textAlign: TextAlign.center,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),)
                ],
              ),
              ),),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: kbottomContainerHeight,
              decoration: BoxDecoration(
                color: kbottomContainerColor,
              ),
              child: Center(child: Text("RE-CALCULATE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))),
            ),
          ),
        ],
      )
    );
  }
}
