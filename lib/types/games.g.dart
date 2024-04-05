// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      review: (json['review'] as num).toDouble(),
      dlc: (json['dlc'] as num).toDouble(),
      duration: (json['duration'] as num).toDouble(),
      inGamePop: (json['in_game_pop'] as num).toDouble(),
      screenshotUrl: json['screenshot_URL'] as String,
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'review': instance.review,
      'dlc': instance.dlc,
      'duration': instance.duration,
      'in_game_pop': instance.inGamePop,
      'screenshot_URL': instance.screenshotUrl,
    };
