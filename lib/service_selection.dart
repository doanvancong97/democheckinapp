
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_checkin_fake/models/Appointment.dart';
import 'package:go_checkin_fake/models/Customer.dart';
import 'package:go_checkin_fake/models/Promo.dart';
import 'package:go_checkin_fake/models/Service.dart';
import 'package:go_checkin_fake/models/ServiceCategory.dart';
import 'package:go_checkin_fake/staff_selection.dart';
import 'package:go_checkin_fake/widgets/custom_masked_text.dart';
import 'package:go_checkin_fake/widgets/expandable.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class ServiceSelection extends StatefulWidget {

  Appointment appointment;
  ServiceSelection(this.appointment);

  @override
  _ServiceSelectionState createState() => _ServiceSelectionState(appointment);
}


class _ServiceSelectionState extends State<ServiceSelection> {
  Appointment appointment;
  _ServiceSelectionState(this.appointment);

  List<Service> listServices = Service.getAllServies();
  List<ServiceCategory> listCats = ServiceCategory.getAllCategories();
  TextEditingController txtName = new TextEditingController();
  List<Service> selectedServices = [];

  ItemScrollController controller = new ItemScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => clickOnCategory(listCats[0].id,0));
  }

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
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center(child: Image.asset("assets/images/logo.png")),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
                child: Text("Which services do you want to choose?", textAlign: TextAlign.center,style: TextStyle(color: Colors.white70,fontSize: 17),),
              ),

              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if(listCats != null)...[
                        for(ServiceCategory serviceCategory in listCats)...[
                          GestureDetector(
                            onTap:(){
                              print("aaa");
                              clickOnCategory(serviceCategory.id,listCats.indexOf(serviceCategory));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white70, //                   <--- border color
                                  width: 1.0,
                                ),
                                color: serviceCategory.isSelected ? Colors.white : Colors.black87
                              ),
                              width: MediaQuery.of(context).size.width / 3 - 10,
                              height: 50,
                              child: Center(
                                  child: Text(serviceCategory.name,style: TextStyle(color: serviceCategory.isSelected ? Colors.black : Colors.white70,fontWeight: FontWeight.bold,fontSize: 18),)),
                            ),
                          )



                        ]
                      ]

                    ],
                  ),
                ),

              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 25),
                  child: ScrollablePositionedList.builder(
                      itemCount: listCats.length,
                      itemScrollController: controller,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(listCats[index].name,textAlign: TextAlign.left, style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical:10),
                                  height: 0.4,
                                  color: Colors.white,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Column(

                                    children: [
                                      for(Service service in findServiceByCategory(listCats[index].id))...[
                                        Container(
                                          child: Row(
                                            children: [
                                              Expanded(child: Text("  "+service.name,style: TextStyle(color: Colors.white,fontSize: 16))),
                                              Checkbox(
                                                activeColor: Color(0xff0090BE),
                                                checkColor: Colors.white,
                                                value: service.isSelected,
                                                onChanged: (bool? newValue) {
                                                  setState(() {
                                                    service.isSelected = !service.isSelected;

                                                    if(service.isSelected){
                                                      selectedServices.add(service);
                                                    }
                                                    else{
                                                      selectedServices.remove(service);
                                                    }
                                                  });
                                                },
                                                side: BorderSide(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]
                                    ],
                                  ),

                                )
                              ],
                            ),
                          ),
                        );
                      }),




              )),

              Container(
                height: 90,
                padding: EdgeInsets.all(20),
                child:
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(builder: (context) => StaffSelection(appointment)),
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
                        onTap: (){
                          appointment.servicesList = selectedServices;
                          Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(builder: (context) => StaffSelection(appointment)),
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

   clickOnCategory(BigInt id,int index) {
    for(ServiceCategory cat in listCats){
      if(cat.id == id){
        cat.isSelected = true;
      }else cat.isSelected = false;
    }
    controller.scrollTo(index: index, duration: Duration(milliseconds: 500));
    setState(() {
    });


  }


}




