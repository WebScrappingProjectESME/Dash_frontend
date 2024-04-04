// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      name: json['name'] as String,
      review: (json['review'] as num).toDouble(),
      price: json['price'] as String,
      screenshotUrl: json['screenshot_URL'] as String,
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'name': instance.name,
      'review': instance.review,
      'price': instance.price,
      'screenshot_URL': instance.screenshotUrl,
    };
