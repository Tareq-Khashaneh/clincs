import 'package:untitled1/core/constants/typedef.dart';

class OfferModel {
  final String title;
  final String description;
  final String likes;
  final String reviews;
  final List gallery;
  OfferModel({required this.title,required this.description, required this.likes, required this.reviews,required this.gallery});
  factory OfferModel.fromJson(parameters json)
  => OfferModel(title: json['title'], description: json['description'],likes: json['likes'].toString(), reviews: json['reviews'].toString(),gallery: json['gallery']);
}