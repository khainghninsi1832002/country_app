// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      json['name']['common'] as String?,
      json['region'] as String?,
      json['cca2'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'common': instance.common,
      'region': instance.region,
      'cca2': instance.cca2,
    };
