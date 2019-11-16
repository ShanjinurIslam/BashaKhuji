class Ad {
  final String userID;
  final String flatNumber;
  final String houseName;
  final String houseFloor;
  final String catagory;
  final String address;
  final int rent;
  final int numberOfBeds;
  final int numberOfToilets;
  final String phoneNumber;
  // more features can be added here

  Ad(
      {this.userID,
      this.flatNumber,
      this.houseName,
      this.houseFloor,
      this.catagory,
      this.address,
      this.rent,
      this.numberOfBeds,
      this.numberOfToilets,
      this.phoneNumber});
}
