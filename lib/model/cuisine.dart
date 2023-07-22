import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Cuisine {
  Cuisine(
      {required this.title,
      required this.image,
      required this.description,
      required this.venue})
      : id = uuid.v4();
  final String id;
  final String venue;
  final String title;
  final String image;
  final String description;
}
