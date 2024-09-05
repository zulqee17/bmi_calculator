import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusablebutton.dart';
import '../constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height=180;
  int weight=60;
  int age=18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("BMI Calculator"),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedGender=Gender.male;
                          });
                        },
                        child: ReusableCard(
                          color: selectedGender==Gender.male?kactiveCardColor:kinactiveCardColor,
                          CardChild: IconContent(
                              icon: FontAwesomeIcons.mars, label: "MALE"),
                        ),
                      )),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedGender=Gender.female;
                          });
                        },
                        child: ReusableCard(
                            color: selectedGender==Gender.female?kactiveCardColor:kinactiveCardColor,
                            CardChild: IconContent(
                                icon: FontAwesomeIcons.venus, label: "FEMALE"),),
                      ),),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kactiveCardColor,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT",style: klabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),style: klabelTextStyle1,),
                        Text("cm",style: klabelTextStyle,)
                      ],
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.pink,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayColor: Color(0x29EB1555),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,

                          onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                          }),
                    )
                  ],
                ),

              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kactiveCardColor,
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT",style: klabelTextStyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children:[
                            Text(weight.toString(),style: klabelTextStyle1,),
                            Text("kg",style: klabelTextStyle,)
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                                backgroundColor: Color(0xff4C4F5E),
                                shape: CircleBorder(),
                              child: Icon(FontAwesomeIcons.minus,size: 35,),),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                                backgroundColor: Color(0xff4C4F5E),
                                shape: CircleBorder(),
                                child: Icon(FontAwesomeIcons.plus,size: 35,),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kactiveCardColor,
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE",style: klabelTextStyle),
                          Text(age.toString(),style: klabelTextStyle1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                                backgroundColor: Color(0xff4C4F5E),
                                shape: CircleBorder(),
                                child: Icon(FontAwesomeIcons.minus,size: 35,),),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                                backgroundColor: Color(0xff4C4F5E),
                                shape: CircleBorder(),
                                child: Icon(FontAwesomeIcons.plus,size: 35,),),
                            ],
                          )
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){

                CalculatorBrain cb=CalculatorBrain(Height: height, Weight: weight);

                Navigator.push(
                  context,
                    MaterialPageRoute(
                        builder: (context)=>ResultPage(
                          Result: cb.getResult(),
                          rText: cb.getText(),
                          rInteroretation: cb.getFeedback(),
                        ),),);
              },
              child: Container(
                width: double.infinity,
                height: kbottomContainerHeight,
                decoration: BoxDecoration(
                  color: kbottomContainerColor,
                ),
                child: Center(child: Text("CALCULATE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))),
              ),
            ),
          ],
        ));
  }
}




