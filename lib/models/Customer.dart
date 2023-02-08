class Customer{
  BigInt id;
  String name;
  String phoneNumber;
  String address;
  double rewardPoint = 0;
  int totalVisits = 0;

  Customer(this.id, this.name, this.phoneNumber, this.address, this.rewardPoint,
      this.totalVisits);
}