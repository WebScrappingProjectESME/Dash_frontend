// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_histo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesHisto _$SalesHistoFromJson(Map<String, dynamic> json) => SalesHisto(
      name: json['name'] as String,
      date: json['date'] as String,
      reduc: (json['reduc'] as num).toDouble(),
    );

Map<String, dynamic> _$SalesHistoToJson(SalesHisto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'reduc': instance.reduc,
    };
