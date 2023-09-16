import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Bmiapp(),
    );
  }
}

class Bmiapp extends StatefulWidget {
  const Bmiapp({super.key});

  @override
  State<Bmiapp> createState() => _BmiappState();
}

class _BmiappState extends State<Bmiapp> {
  var wtcontroller=TextEditingController();
  var ftcontroller=TextEditingController();
  var inchcontroller = TextEditingController();
  var result='';
  var bgcolor =Colors.indigo.shade100 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bmi',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 33),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [

              Color(0xffe3eeff),
              Color(0xfff3e7e9),
              Colors.red.shade100,


            ],
           center: Alignment.centerRight,
            

          ),
        ),
        child: Center(
          child: Container(
             
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(color: Colors.blue,fontSize: 34,fontWeight: FontWeight.w300,),),
                SizedBox(height: 11,),

                TextField( maxLength: 3,
                  controller: wtcontroller,
                  keyboardType:TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('enter your wieght (in kg)'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 3,
                      ),

                    ),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                ),
                SizedBox(height: 11,),
                TextField( maxLength: 3,
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    label: Text('enter your height (in feet) '),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 3,
                      ),
                    ),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField( maxLength: 3,
                  controller:inchcontroller ,
                  decoration: InputDecoration(
                    label: Text('enter your height (in inch)'),
                    border: OutlineInputBorder(

                      borderSide: BorderSide(color: Colors.white,width: 3,
                      ),

                    ),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),

                ElevatedButton(onPressed: (){
                  var wt = wtcontroller.text.toString();
                  var ft =ftcontroller.text.toString();
                  var inch= inchcontroller.text.toString();
                  if(wt!="" && ft!="" && inch!=""){
                    //BMI calculation
                    var iwt= int.parse(wt);
                    var ift = int.parse(ft);
                    var Iinch=int.parse(inch);

                    var tinch= ift*12+Iinch;
                    var tcm = (tinch* 2.54);
                    var tm= tcm/100;
                    var bmi = iwt/(tm*tm);

                    var msg;
                    if (bmi>25){
                      msg='you are overweight';
                      bgcolor =Colors.redAccent;
                    }else if(bmi<18){
                      msg ='you are underweight';
                      bgcolor=Colors.blueAccent.shade100;
                    }else{
                      msg ='you are healthy';
                      bgcolor =Colors.orangeAccent;
                    }


                      setState(() {
                        result='$msg \n your Bmi is ${bmi.toStringAsFixed(3)}';
                        //tostringasfixed is used for how much no you want after the point.
                      });


                  } else{
                   setState(() {
                     result=('please fill all fields');
                   });

                  }
                }, child: Text('Calculate Bmi'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 11,),
                Text(result,style: TextStyle( fontWeight: FontWeight.w300),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
