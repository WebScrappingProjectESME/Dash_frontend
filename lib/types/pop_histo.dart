import 'package:json_annotation/json_annotation.dart';

// To build this generated file : dart run build_runner build
part 'pop_histo.g.dart';

@JsonSerializable(explicitToJson: true)
class PopHisto{
  final List<int> week;
  final List<int> month;
  final List<int> year;

  PopHisto({
    required this.week,
    required this.month,
    required this.year,
  });

  factory PopHisto.fromJson(Map<String, dynamic> json) => _$PopHistoFromJson(json);
  Map<String, dynamic> toJson() => _$PopHistoToJson(this);
}
