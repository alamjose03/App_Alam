class UserModel {
  String name = '';
  String flastname = '';
  String mlastname = '';
  String process = '';
  String phone = '';
  String age = '';
  String address = '';
  String zipcode = '';
  String city = '';
  String image = '';
  String email = '';

  UserModel({
    required this.name,
    required this.flastname,
    required this.mlastname,
    required this.process,
    required this.phone,
    required this.age,
    required this.address,
    required this.zipcode,
    required this.city,
    required this.image,
    required this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        flastname = json['LastNameP'],
        mlastname = json['LastNameM'],
        process = json['Process'],
        phone = json['Phone'],
        age = json['Age'],
        address = json['Address'],
        zipcode = json['Zipcode'],
        city = json['City'],
        image = json['Image'],
        email = json['Email'];

  Map<String, dynamic> toJson() => {
        'Name': name,
        'LastNameP': flastname,
        'LastNameM': mlastname,
        'Process': process,
        'Phone': phone,
        'Age': age,
        'Address': address,
        'Zipcode': zipcode,
        'City': city,
        'Image': image,
        'Email': email,
      };
}
