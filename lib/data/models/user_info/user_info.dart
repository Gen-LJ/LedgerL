import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfoModel extends UserInfoEntity with _$UserInfoModel {
  const factory UserInfoModel({
    required String id,
    required String email,
    required String name,
    String? profileImage,
  }) = _UserInfoModel;


  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);



  factory UserInfoModel.fromEntity(UserInfoEntity user) {
    return UserInfoModel(
      id: user.id,
      email: user.email,
      name: user.name,
      profileImage: user.profileImage,
    );
  }

  factory UserInfoModel.fromFireStore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserInfoModel(
      id: data['id'] as String,
      email: data['email'] as String,
      name: data['name'] as String,
      profileImage: data['profileImage'] as String?,
    );
  }
}
