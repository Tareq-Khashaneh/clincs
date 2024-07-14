




import '../../../../core/constants/typedef.dart';

class LoginModel {
  final String token;
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String image;
  final Map<String,dynamic> city;

  LoginModel({ required this.name,required this.lastName,required this.email,required this.phone,required this.image,required this.city,required this.token});
  factory LoginModel.fromJson(parameters json)
  => LoginModel(name: json['name'],lastName: json['lastName'], email: json['email'], phone: json['phone'], image: json['image'], city: json['city'], token: json['token'],);
}
