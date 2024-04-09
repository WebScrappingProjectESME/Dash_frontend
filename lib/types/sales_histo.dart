import 'package:json_annotation/json_annotation.dart';

// To build this generated file : dart run build_runner build
part 'sales_histo.g.dart';

@JsonSerializable(explicitToJson: true)
class SalesHisto{
  final String name;
  final String date;
  final double reduc;

  SalesHisto({
    required this.name,
    required this.date,
    required this.reduc
  });

  factory SalesHisto.fromJson(Map<String, dynamic> json) => _$SalesHistoFromJson(json);
  Map<String, dynamic> toJson() => _$SalesHistoToJson(this);
}
