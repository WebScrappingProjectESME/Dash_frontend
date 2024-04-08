import 'package:json_annotation/json_annotation.dart';

// To build this generated file : dart run build_runner build
part 'games.g.dart';



@JsonSerializable(explicitToJson: true)
class Game{
  final String name;
  final double price;
  final double review;
  final double dlc;
  final double duration;
  final double reduction;

  @JsonKey(name: "in_game_pop")
  final double inGamePop;

  @JsonKey(name: "screenshot_URL")
  final List<String> screenshotUrl;

  Game({
    required this.name,
    required this.price,
    required this.review,
    required this.dlc,
    required this.duration,
    required this.reduction,
    required this.inGamePop,
    required this.screenshotUrl
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
