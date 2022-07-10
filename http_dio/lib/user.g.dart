// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      info: json['info'] == null
          ? null
          : UserInfo.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'info': instance.info,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      poster: json['poster'] as String,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'poster': instance.poster,
    };
