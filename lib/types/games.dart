import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'games.g.dart';


@JsonSerializable(explicitToJson: true)
class Game{
  @JsonKey(name: '_id')

  final String name;
  final double review;
  final String price;
  final List<String> screenshot_url_list;

  Game({required this.name, required this.review, required this.price, required this.screenshot_url_list});

}
