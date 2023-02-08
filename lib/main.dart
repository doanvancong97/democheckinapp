
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_checkin_fake/cust_info.dart';
import 'package:go_checkin_fake/models/Appointment.dart';
import 'package:go_checkin_fake/models/Customer.dart';
import 'package:go_checkin_fake/models/Promo.dart';
import 'package:go_checkin_fake/widgets/custom_masked_text.dart';
import 'package:go_checkin_fake/widgets/expandable.dart';

void main() {
  runApp(MyApp());
}
TextEditingController txtMobile = new TextEditingController();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
const loremIpsum =
    "By checking this box and clicking NEXT, you give GoCheckIn, as well as FastBoy Sales Demo, express written consent to contact you at the number entered for booking reminder or promotional purposes. Consent is not required to check in or make a purchase. You also agree to the Terms and Conditions/Privacy Policy and Store Policy";


class _MyHomePageState extends State<MyHomePage> {
  bool isCheck = false;

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
                height: 0.3,
                color: Colors.white,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                child: Center(child: Text("Helen Nails and Spa ",style: TextStyle(color: Colors.white,fontWeight : FontWeight.bold,fontSize: 28),)),
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if(Promo.getListPromo() != null)...[
                        for(Promo promo in Promo.getListPromo())...[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                                color: promo.startColor,
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [promo.startColor, promo.endColor])
                            ),
                            width: MediaQuery.of(context).size.width / 3 - 6,
                            height: 100,
                            child: Column(
                              children: [
                                Expanded(
                                    flex:2,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 5),
                                      child: Column(
                                        children: [
                                          Text(promo.point.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
                                          Text("Points",style: TextStyle(color: Colors.white,),)
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex:1,
                                    child: Text(promo.desc,style: TextStyle(color: Colors.white),)),
                              ],
                            ),
                          )



                        ]
                      ]

                    ],
                  ),
                ),

              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                child: Text("Please enter your cell phone number!\nYour info will not be shared with any third party.",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 16),),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("",style: TextStyle(color: Colors.white,fontSize: 15),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                  child: CustomMaskedTextField(
                    mask: "(###) ###-####",
                    escapeCharacter: '#',
                    maskedTextFieldController: txtMobile,
                    maxLength: 14,
                    keyboardType: TextInputType.phone,
                    inputDecoration: InputDecoration(
                      hintText: "Enter Phone Number",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        counterText: ""
                    ),
                    onChange: (String value) { 
                      
                      
                    },

                  )
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    width: 70,
                    child: Checkbox(
                      activeColor: Color(0xff0090BE),
                      checkColor: Colors.white,
                      value: isCheck,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheck = !isCheck;
                        });
                    },
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment: ExpandablePanelHeaderAlignment.bottom,
                          tapBodyToCollapse: true,
                          iconPlacement: ExpandablePanelIconPlacement.right,
                          iconColor: Colors.white
                        ),
                        collapsed: Text(
                          loremIpsum,
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Text(
                                loremIpsum,
                                style: TextStyle(color: Colors.white),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme: const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                        header: Container(),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  //TODO validate check box terms and condition
                  //case not checked : show error msg
                  if(!isCheck){
                    showAlertDialog(context);
                    return;
                  }
                  
                  
                  //case checked, if mobile phone is existed in system, get the customer by phone, else create new customer
                  String phone = txtMobile.text.replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "").replaceAll("-", "");
                  Customer newCust = new Customer(BigInt.from(1), "", phone , "", 0, 0);

                  Appointment app = new Appointment(newCust);
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (context) => CustInfo(app)),
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

  void showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning".toUpperCase()),
      content: Text("Please check the box to agree with our terms and conditions!."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}




