import 'package:json_annotation/json_annotation.dart';
part 'detail.g.dart';

@JsonSerializable()
class Detail {
  final String? common;
  final String? region;
  final String? subregion;
  final int? population;
  final Map<String, dynamic>? demonyms;
  final String? cca2;

  Detail(this.common, this.region, this.subregion, this.population,
      this.demonyms, this.cca2);

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
