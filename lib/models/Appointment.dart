import 'package:go_checkin_fake/models/Customer.dart';
import 'package:go_checkin_fake/models/Service.dart';
import 'package:go_checkin_fake/models/Staff.dart';

class Appointment{
  BigInt id = BigInt.from(0);
  List<Staff> staffList = [];
  List<Service> servicesList = [];
  Customer customer;
  String timeCheckIn = "";
  int duration = 0;
  DateTime dateTime = DateTime.now();
  double price =0;

  Appointment(this.customer);
}