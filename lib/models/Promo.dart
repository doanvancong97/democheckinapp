import 'package:flutter/material.dart';

class Promo{
  String desc = "";
  int point = 0;
  Color startColor;
  Color endColor;



  Promo(this.desc, this.point,this.startColor,this.endColor);

  static List<Promo> getListPromo(){
     Promo p1 = new Promo("Promo 1",5,Colors.green,Colors.greenAccent);
     Promo p2 = new Promo("Promo 2",10,Colors.blueAccent,Colors.lightBlueAccent);
     Promo p3 = new Promo("Promo 3",15,Colors.purple,Colors.purpleAccent);
     Promo p4 = new Promo("Promo 4",5,Colors.red,Colors.redAccent);
     Promo p5 = new Promo("Promo 5",10,Colors.deepOrangeAccent,Colors.orangeAccent);

     return [p1,p2,p3,p4,p5];
  }

}