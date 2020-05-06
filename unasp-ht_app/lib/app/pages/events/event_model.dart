import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class Event {
  final DateTime going;
  final DateTime turning;
  final String location;
  final String reason;
  final EventStatus status;
  final String userId;

  Event(this.going, this.turning, this.location, this.reason, this.status,
      this.userId);

  factory Event.fromJson(Map<String, dynamic> json) =>
      _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

enum EventStatus { solicitado, aprovado, rejeitado }
