// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Eventos _$EventFromJson(Map<String, dynamic> json) {
  return Eventos(
    json['titulo'] as String,
    json['inicio'] == null ? null : DateTime.parse(json['inicio'] as String),
    json['termino'] == null ? null : DateTime.parse(json['termino'] as String),
    json['local'] as String,
    json['obs'] as String,
    _$enumDecodeNullable(_$EventStatusEnumMap, json['status']),
    json['userId'] as String,
  );
}

Map<String, dynamic> _$EventToJson(Eventos instance) => <String, dynamic>{
      'titulo': instance.titulo.toString(),
      'inicio': instance.inicio?.toIso8601String(),
      'termino': instance.termino?.toIso8601String(),
      'local': instance.local.toString(),
      'obs': instance.obs.toString(),
      'status': _$EventStatusEnumMap[instance.status],
      'userId': instance.userId,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('Um valor deve ser fornecido. Valores suportados: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` Não é um dos valores suportados: '
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
  EventStatus.pendente: 'pendente',
  EventStatus.decorrendo: 'decorrendo',
  EventStatus.encerrado: 'encerrado',
};
