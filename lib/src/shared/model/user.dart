import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'uid')
  final String uid;
  @JsonKey(name: 'displayName')
  final String name;
  @JsonKey(name: 'photoUrl')
  final String photoUrl;

  User({required this.uid, required this.name, required this.photoUrl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
