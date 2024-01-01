import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _ClockState();
}

class _ClockState extends State<HomeScreen> {
   int hour=0;
   int minute=0;
   int second=0;
   int day=0;
   int month=0;
   int year=0;
   bool digital = false;
   bool analog= false;
   bool strap=false;
   String am="";



   @override
  void initState() {
    super.initState();
    gettime();
  }
   void getTime()
   {

     hour=DateTime.now().hour;
     minute=DateTime.now().minute;
     second=DateTime.now().second;
     day=DateTime.now().day;
     month=DateTime.now().month;
     year=DateTime.now().year;
     Future.delayed(const Duration(seconds:1),()=>getTime(),);
     setState(() {

     });
   }

   void gettime(){
     hour=DateTime.now().hour;
     minute=DateTime.now().minute;
     second=DateTime.now().second;
     day=DateTime.now().day;
     month=DateTime.now().month;
     year=DateTime.now().year;

     Future.delayed(const Duration(seconds:1),()=>gettime());
     setState(() {

     });
   }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text("Clock App 🇮🇳",
              style: TextStyle(color: Colors.white)),
        ),
        body: Stack(
          children: [
            Center(
              child: Visibility(
                visible: digital,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //digital watch
                  const Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.alarm,color: Colors.blue),
                       SizedBox(width: 30,),
                       Icon(Icons.mobile_friendly,color:Colors.blue),
                       SizedBox(width: 30,),
                       Icon(Icons.shutter_speed_outlined,color:Colors.blue),
                     ],
                   ),
                    const SizedBox(height: 5,),
                    Text("$hour:$minute:$second",
                    style: const TextStyle(fontSize: 40,color: Colors.green)),
                    const SizedBox(height: 5,),
                    Text("$day/$month/$year",
                        style: const TextStyle(fontSize: 25,color: Colors.green)),
                  ],
                ),
               )
                // digital Watch

            ),

            Visibility(
              visible: analog,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      height:280,
                      width: 280,
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        color: Colors.amber,

                        value: second/60,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height:310,
                      width:310,
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                        strokeWidth: 20,
                        value: minute/60,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height:350,
                      width: 350,
                      child: CircularProgressIndicator(
                        strokeWidth: 20,
                        color: Colors.greenAccent,
                        value: hour/12,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ]
        ),

        // analog Watch
        drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    digital = !digital;
                  });
                },
                label: const Text("Digital Clock",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )
                ),
              ),
              const SizedBox(height: 10,),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    analog = !analog;
                  }
                  );
                },
                label: const Text("Analog Clock",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )
                ),
              ),
              const SizedBox(height: 10,),
              FloatingActionButton.extended(
                 onPressed: () {
                  setState(() {
                     strap = !strap;
                  });
                 },
                 label: const Text("Strap Watch",style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                 )),
               ),
            ],
          ),
        ),

      ),

            );
  }

}

