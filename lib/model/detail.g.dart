// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      json['name'] != null ? json['name']['common'] as String? : null,
      json['region'] as String?,
      json['subregion'] as String?,
      (json['population'] as num?)?.toInt(),
      json['demonyms'] as Map<String, dynamic>?, // Changed here
      json['cca2'] as String?,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'common': instance.common,
      'region': instance.region,
      'subregion': instance.subregion,
      'population': instance.population,
      'demonyms': instance.demonyms,
      'cca2': instance.cca2,
    };
