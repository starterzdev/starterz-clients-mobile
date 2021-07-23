import 'package:json_annotation/json_annotation.dart';
import 'package:starterz/provider/auth/domain/auth_request.dart';

part 'integrate_request.g.dart';

@JsonSerializable()
class IntegrateRequest {
  String email;
  AuthType authType;
  String oAuthToken;
  IntegrateRequest(
      {required this.email, required this.authType, required this.oAuthToken});

  factory IntegrateRequest.fromJson(Map<String, dynamic> json) =>
      _$IntegrateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$IntegrateRequestToJson(this);
}
