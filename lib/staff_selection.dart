
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_checkin_fake/models/Appointment.dart';
import 'package:go_checkin_fake/models/Customer.dart';
import 'package:go_checkin_fake/models/Promo.dart';
import 'package:go_checkin_fake/models/Service.dart';
import 'package:go_checkin_fake/models/ServiceCategory.dart';
import 'package:go_checkin_fake/models/Staff.dart';
import 'package:go_checkin_fake/success_screen.dart';
import 'package:go_checkin_fake/widgets/custom_masked_text.dart';
import 'package:go_checkin_fake/widgets/expandable.dart';


class StaffSelection extends StatefulWidget {

  Appointment appointment;
  StaffSelection(this.appointment);

  @override
  _StaffSelectionState createState() => _StaffSelectionState(appointment);
}


class _StaffSelectionState extends State<StaffSelection> {
  Appointment appointment;
  List<Staff> selectedStaff = [];
  _StaffSelectionState(this.appointment);
  List<Staff> listStaffs = Staff.getAllStaffs();
  List<Service> listServices = Service.getAllServies();
  List<ServiceCategory> listCats = ServiceCategory.getAllCategories();
  TextEditingController txtName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        height: double.infinity,
        child: Container(
          height: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Center(child: Image.asset("assets/images/logo.png")),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                child: Text("Please choose your preferred staff", textAlign: TextAlign.center,style: TextStyle(color: Colors.white70,fontSize: 17),),
              ),

              Expanded(
                  child: Container(
                    child: GridView.count(
                        crossAxisCount: 3,
                        children: [
                          for(Staff staff in listStaffs)...[
                            InkWell(
                              onTap: (){
                                setState(() {
                                  staff.isSelected = !staff.isSelected;
                                  if(staff.isSelected){
                                    selectedStaff.add(staff);
                                  }else{
                                    selectedStaff.remove(staff);
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.all(5),
                                            child: Image.memory(base64Decode(staff.avatarBase64)))),
                                    Container(
                                        child: Text(staff.nickName, style: TextStyle(color: staff.isSelected ? Colors.black87 : Colors.white70),)),
                                  ],
                                ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white70, //                   <--- border color
                                        width: 1.0,
                                      ),
                                      color: staff.isSelected ? Colors.white : Color(0xff121a14),
                                  )

                              ),
                            )
                          ]

                        ],

                    ),




                  )),

              Container(
                height: 90,
                padding: EdgeInsets.all(20),
                child:
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap:  ()  async {
                          Appointment appt = await submitAppointmentToDB(appointment);
                          Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(builder: (context) => SuccessScreen(appt)),
                                  (route) => false
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Center(child: Text('Skip', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,)),
                        ),
                      ),

                    ),
                    Expanded(
                      child: InkWell(
                        onTap:  ()  async {
                          appointment.staffList = selectedStaff;
                          Appointment appt = await submitAppointmentToDB(appointment);
                          Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(builder: (context) => SuccessScreen(appt)),
                                  (route) => false
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: Center(child: Text('Next', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,)),
                    ),
                      ),
                    ),

                  ],
                )
              )















            ],
          ),
        ),

      ),
    );
  }

  List<Service> findServiceByCategory(BigInt catID){
    List<Service> results = [];
    for(Service service in listServices){
      if(service.categoryId == catID){
        results.add(service);
      }
    }
    return results;
  }

   clickOnCategory(BigInt id) {
    for(ServiceCategory cat in listCats){
      if(cat.id == id){
        cat.isSelected = true;
      }else cat.isSelected = false;
    }
    setState(() {
    });


  }

  Appointment submitAppointmentToDB(Appointment appointment) {
    //TODO ZZZ

    return appointment;
  }


}




