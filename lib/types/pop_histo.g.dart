// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pop_histo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopHisto _$PopHistoFromJson(Map<String, dynamic> json) => PopHisto(
      week: (json['week'] as List<dynamic>).map((e) => e as int).toList(),
      month: (json['month'] as List<dynamic>).map((e) => e as int).toList(),
      year: (json['year'] as List<dynamic>).map((e) => e as int).toList(),
      growth: (json['growth'] as num).toDouble(),
    );

Map<String, dynamic> _$PopHistoToJson(PopHisto instance) => <String, dynamic>{
      'week': instance.week,
      'month': instance.month,
      'year': instance.year,
      'growth': instance.growth,
    };
