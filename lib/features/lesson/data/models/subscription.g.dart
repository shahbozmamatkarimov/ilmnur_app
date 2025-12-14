// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
  userId: (json['user_id'] as num).toInt(),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user': instance.user.toJson(),
    };
