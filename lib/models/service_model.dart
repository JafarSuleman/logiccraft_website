import 'package:flutter/cupertino.dart';

class ServiceModel {
  final String title;
  final String description;
  final String iconData;
  final IconData? icon;
  final List<String>? features;
  
  ServiceModel({
    required this.title,
    required this.description,
    required this.iconData,
    this.features,
     this.icon,
  });
}