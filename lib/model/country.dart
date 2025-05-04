import 'package:json_annotation/json_annotation.dart';
part 'country.g.dart';

@JsonSerializable()
class Country {
  final String? common;
  final String? region;
  final String? cca2;
  Country(this.common, this.region, this.cca2);

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
