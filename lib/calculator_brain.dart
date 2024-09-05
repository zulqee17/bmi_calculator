import 'dart:math';
class CalculatorBrain{
  final int Height;
  final int Weight;
  CalculatorBrain({required this.Height,required this.Weight});

  double? _bmi;

  String getResult(){
    _bmi=Weight/pow(Height/100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getText(){
    if(_bmi! >= 25.0){
      return 'Overweight';
    }else if(_bmi! >18.5){
      return 'Normal';
    }else{
      return 'underweight';
    }
  }

  String getFeedback(){
    if(_bmi! >= 25.0){
      return 'You have higher then normal body weight. Try to exercise more.';
    }else if(_bmi! >18.5){
      return 'You have normal body weight. Good Job!';
    }else{
      return 'You have lower then a normal body weight. You can eat a bit more.';
    }
  }


}
