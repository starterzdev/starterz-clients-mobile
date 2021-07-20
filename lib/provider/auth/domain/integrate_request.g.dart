// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integrate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntegrateRequest _$IntegrateRequestFromJson(Map<String, dynamic> json) {
  return IntegrateRequest(
    email: json['email'] as String,
    authType: _$enumDecode(_$AuthTypeEnumMap, json['authType']),
    oAuthToken: json['oAuthToken'] as String,
  );
}

Map<String, dynamic> _$IntegrateRequestToJson(IntegrateRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'authType': _$AuthTypeEnumMap[instance.authType],
      'oAuthToken': instance.oAuthToken,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$AuthTypeEnumMap = {
  AuthType.KAKAO: 'KAKAO',
};
