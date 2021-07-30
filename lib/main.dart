import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMI(),
      
    );
  }
}

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  int currentindex = 0;
  String result="";
  double height=0;
  double weight=0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          
          title: Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Colors.black),
          ),
          
          elevation: 0.0,
          backgroundColor: Colors.yellow,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
              color: Colors.black,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.blue, 0),
                    radioButton("Woman", Colors.blue, 1),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Your Height in cm:",
                  style: TextStyle(
                    fontSize: 18.8,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    controller :heightController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Your Height in cm",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ))),
                SizedBox(height: 20.0),
                Text(
                  "Your Weight in kg:",
                  style: TextStyle(
                    fontSize: 18.8,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Your Weight in kg",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ))),
                SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      setState((){
                       height = double.parse(heightController.value.text);
                      weight = double.parse(weightController.value.text);
                      });
                      BMI(height,weight);
                    },
                    color: Colors.blue,
                    child: Text("CALCULATE",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width:double.infinity,
                  child: Text(
                    "Your BMI is :",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50.0,),
               
                Container(
                  width:double.infinity,
                  child: Text(
                   "$result",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 void BMI (double height,double weight){
   double  finalresult=weight/(height*height)*10000;
   String bmi=finalresult.toStringAsFixed(2);
   setState((){
     result =bmi; 
   });

 }
  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: FlatButton(
          color: currentindex == index ? color : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
