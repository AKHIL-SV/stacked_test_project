import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String name;
  String email;
  String gender;
  String status;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
