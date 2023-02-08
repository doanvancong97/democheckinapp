class ServiceCategory{
  BigInt id;
  String name;
  bool isSelected = false;

  ServiceCategory(this.id, this.name);

  static List<ServiceCategory> getAllCategories(){
    ServiceCategory cat1 = new ServiceCategory(BigInt.from(1), "Cat 1");
    ServiceCategory cat2 = new ServiceCategory(BigInt.from(2), "Cat 2");
    ServiceCategory cat3 = new ServiceCategory(BigInt.from(3), "Cat 3");
    ServiceCategory cat4 = new ServiceCategory(BigInt.from(4), "Cat 4");

    return [cat1,cat2,cat3,cat4];


  }
}