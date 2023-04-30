import 'package:json_annotation/json_annotation.dart';
import '../../model/user/user_model.dart';
part 'user_list_reponse.g.dart';

@JsonSerializable()
class UserListResponse {
  int code;
  Map<String, Map<String, int>> meta;
  List<UserModel> data;
  UserListResponse({
    required this.code,
    required this.meta,
    required this.data,
  });
  factory UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserListResponseToJson(this);
}
