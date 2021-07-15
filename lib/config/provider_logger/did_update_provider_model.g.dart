// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'did_update_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DidUpdateProviderModel _$DidUpdateProviderModelFromJson(
    Map<String, dynamic> json) {
  return DidUpdateProviderModel(
    json['provider'] as String,
    json['newValue'],
  );
}

Map<String, dynamic> _$DidUpdateProviderModelToJson(
        DidUpdateProviderModel instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'newValue': instance.newValue,
    };
