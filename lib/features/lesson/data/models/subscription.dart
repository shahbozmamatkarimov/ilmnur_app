// file: models/subscription.dart

import 'package:ilmnur_app/features/user/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription.g.dart';

@JsonSerializable(explicitToJson: true)
class Subscription {
  @JsonKey(name: 'user_id')
  final int userId;
  final User user;

  Subscription({required this.userId, required this.user});

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}
