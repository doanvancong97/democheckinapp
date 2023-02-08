
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_checkin_fake/models/Appointment.dart';
import 'package:go_checkin_fake/models/Customer.dart';
import 'package:go_checkin_fake/models/Promo.dart';
import 'package:go_checkin_fake/service_selection.dart';
import 'package:go_checkin_fake/widgets/custom_masked_text.dart';
import 'package:go_checkin_fake/widgets/expandable.dart';


class CustInfo extends StatefulWidget {

  Appointment appointment;
  CustInfo(this.appointment);

  @override
  _CustInfoState createState() => _CustInfoState(appointment);
}


class _CustInfoState extends State<CustInfo> {
  Appointment appointment;
  _CustInfoState(this.appointment);

  bool isCheck = false;
  TextEditingController txtName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center(child: Image.asset("assets/images/logo.png")),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text("You're Almost Done.\nPlease enter your full name",textAlign: TextAlign.center,style: TextStyle(color: Colors.white70,fontSize: 16),),
              ),

              Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: TextField(
                    controller: txtName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Enter Your Name",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 25,),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        counterText: "",
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  )
              ),

              InkWell(
                onTap: (){
                  //TODO validate if text field "txtName" is empty...
                  appointment.customer.name = txtName.text;
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (context) => ServiceSelection(appointment)),
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
                    child: Center(child: Text('NEXT', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,)),
                  ),
                ),
              ),







            ],
          ),
        ),

      ),
    );
  }


}




