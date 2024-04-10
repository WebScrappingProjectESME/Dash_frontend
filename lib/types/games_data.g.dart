// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameData _$GameDataFromJson(Map<String, dynamic> json) => GameData(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      screenshotUrl: (json['screenshot_url'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      dlc: (json['dlc'] as num).toDouble(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      review: (json['review'] as num).toDouble(),
      lifeTime: (json['duration'] as num).toDouble(),
      inGamePop: (json['in_game_pop'] as num).toDouble(),
      popHisto: PopHisto.fromJson(json['popHisto'] as Map<String, dynamic>),
      salesHisto: (json['salesHisto'] as List<dynamic>)
          .map((e) => SalesHisto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameDataToJson(GameData instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'screenshot_url': instance.screenshotUrl,
      'dlc': instance.dlc,
      'categories': instance.categories,
      'genres': instance.genres,
      'review': instance.review,
      'duration': instance.lifeTime,
      'in_game_pop': instance.inGamePop,
      'popHisto': instance.popHisto.toJson(),
      'salesHisto': instance.salesHisto.map((e) => e.toJson()).toList(),
    };
