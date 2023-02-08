
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_checkin_fake/models/Appointment.dart';
import 'package:go_checkin_fake/models/Customer.dart';
import 'package:go_checkin_fake/models/Promo.dart';
import 'package:go_checkin_fake/models/Service.dart';
import 'package:go_checkin_fake/models/ServiceCategory.dart';
import 'package:go_checkin_fake/models/Staff.dart';
import 'package:go_checkin_fake/widgets/custom_masked_text.dart';
import 'package:go_checkin_fake/widgets/expandable.dart';

import 'main.dart';


class SuccessScreen extends StatefulWidget {

  Appointment appointment;
  SuccessScreen(this.appointment);

  @override
  _SuccessScreenState createState() => _SuccessScreenState(appointment);
}


class _SuccessScreenState extends State<SuccessScreen> {
  Appointment appointment;
  double pointEarn = 0;
  _SuccessScreenState(this.appointment);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(flex: 1, child: Container(),),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/checkmark.gif",
                height: 152.0,
                width: 150.0,
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              // padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
              child: Text("Thank you!", textAlign: TextAlign.center,style: TextStyle(color: Colors.white70,fontSize: 17),),
            ),

            Container(
              padding: EdgeInsets.all(20),
              // padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
              child: Text(appointment.customer.name, textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),),
            ),
            

            Container(
              padding: EdgeInsets.all(20),
              // padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
              child: Text("You have checked in successfully!", textAlign: TextAlign.center,style: TextStyle(color: Colors.white70,fontSize: 17),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              height: 0.3,
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.all(20),
              // padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
              child: Text("Your points", textAlign: TextAlign.center,style: TextStyle(color: Colors.white70,fontSize: 17),),
            ),
            Container(
              padding: EdgeInsets.all(20),
              // padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
              child: Text(appointment.customer.rewardPoint.toString(), textAlign: TextAlign.center,style: TextStyle(color: Colors.green,fontSize:36,fontWeight: FontWeight.bold),),
            ),

            InkWell(
              onTap: (){
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (context) => MyHomePage()),
                        (route) => false
                );


              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Center(child: Text('BACK HOME', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,)),
                ),
              ),
            ),



          ],
        ),

      ),
    );
  }

}




