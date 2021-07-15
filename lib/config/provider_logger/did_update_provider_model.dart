import 'package:json_annotation/json_annotation.dart';

part 'did_update_provider_model.g.dart';

@JsonSerializable()
class DidUpdateProviderModel {
  final String provider;
  Object? newValue;

  DidUpdateProviderModel(this.provider, this.newValue);

  factory DidUpdateProviderModel.fromJson(Map<String, dynamic> json) =>
      _$DidUpdateProviderModelFromJson(json);

  Map<String, dynamic> toJson() => _$DidUpdateProviderModelToJson(this);
}
