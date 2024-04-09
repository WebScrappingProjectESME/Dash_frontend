import 'package:json_annotation/json_annotation.dart';

import 'package:main_project/types/pop_histo.dart';
import 'package:main_project/types/sales_histo.dart';

// To build this generated file : dart run build_runner build
part 'games.g.dart';



@JsonSerializable(explicitToJson: true)
class Game{
  final String name;
  final double price;

  @JsonKey(name: "screenshot_url")
  final List<String> screenshotUrl;

  final double dlc;
  final List<String> categories;
  final List<String> genres;
  final double review;

  @JsonKey(name: "duration")
  final double lifeTime;

  @JsonKey(name: "in_game_pop")
  final double inGamePop;

  final PopHisto popHisto;
  final List<SalesHisto> salesHisto;


  Game({
    required this.name,
    required this.price,
    required this.screenshotUrl,
    required this.dlc,
    required this.categories,
    required this.genres,
    required this.review,
    required this.lifeTime,
    required this.inGamePop,
    required this.popHisto,
    required this.salesHisto
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
