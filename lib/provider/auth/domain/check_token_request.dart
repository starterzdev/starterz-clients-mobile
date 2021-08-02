import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_token_request.g.dart';

@JsonSerializable()
class CheckTokenRequest {
  String token;

  CheckTokenRequest({required this.token});

  factory CheckTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckTokenRequestToJson(this);
}
