class Service{
  BigInt id ;
  BigInt categoryId;
  String name;
  int duration;
  double price = 0;
  bool isSelected = false;
  double rewardPoint = 0;

  Service(this.id, this.categoryId, this.name, this.duration, this.price, this.rewardPoint);

  static List<Service> getAllServies(){
    Service s1 = new Service(BigInt.from(1), BigInt.from(2), "Service 1", 30, 20,10);
    Service s2 = new Service(BigInt.from(2), BigInt.from(2), "Service 2", 35, 30,15);
    Service s3 = new Service(BigInt.from(3), BigInt.from(3), "Service 3", 40, 25,20);
    Service s4 = new Service(BigInt.from(4), BigInt.from(4), "Service 4", 20, 35,25);
    Service s5 = new Service(BigInt.from(5), BigInt.from(1), "Service 5", 10, 15,30);
    Service s6 = new Service(BigInt.from(6), BigInt.from(3), "Service 6", 40, 10,35);
    Service s7 = new Service(BigInt.from(7), BigInt.from(1), "Service 7", 45, 40,40);
    Service s8 = new Service(BigInt.from(8), BigInt.from(1), "Service 8", 25, 50,45);
    Service s9 = new Service(BigInt.from(9), BigInt.from(4), "Service 9", 15, 20,50);

    return [s1,s2,s3,s4,s5,s6,s7,s8,s9];
  }
}