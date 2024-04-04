import 'package:json_annotation/json_annotation.dart';

part 'games.g.dart';


@JsonSerializable(explicitToJson: true)
class Game{
  final String name;
  final double review;
  final String price;

  @JsonKey(name: "screenshot_URL")
  final String screenshotUrl;

  Game({required this.name, required this.review, required this.price, required this.screenshotUrl});

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
