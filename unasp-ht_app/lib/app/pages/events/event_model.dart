import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class Eventos {
  final DateTime inicio;
  final DateTime termino;
  final String local;
  final String obs;
  final EventStatus status;
  final String userId;

  Eventos(
    this.inicio, 
    this.termino, 
    this.local, 
    this.obs, 
    this.status,
    this.userId
  );

  factory Eventos.fromJson(Map<String, dynamic> json) =>
      _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

enum EventStatus { pendente, decorrendo, encerrado }

