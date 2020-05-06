// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    json['going'] == null ? null : DateTime.parse(json['going'] as String),
    json['turning'] == null ? null : DateTime.parse(json['turning'] as String),
    json['location'] as String,
    json['reason'] as String,
    _$enumDecodeNullable(_$EventStatusEnumMap, json['status']),
    json['userId'] as String,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'going': instance.going?.toIso8601String(),
      'turning': instance.turning?.toIso8601String(),
      'location': instance.location,
      'reason': instance.reason,
      'status': _$EventStatusEnumMap[instance.status],
      'userId': instance.userId,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$EventStatusEnumMap = {
  EventStatus.solicitado: 'solicitado',
  EventStatus.aprovado: 'aprovado',
  EventStatus.rejeitado: 'rejeitado',
};
