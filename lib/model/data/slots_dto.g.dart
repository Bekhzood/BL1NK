// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slots_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlotsDto _$SlotsDtoFromJson(Map<String, dynamic> json) => SlotsDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => TimeIntervalDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SlotsDtoToJson(SlotsDto instance) => <String, dynamic>{
      'data': instance.data,
    };

TimeIntervalDto _$TimeIntervalDtoFromJson(Map<String, dynamic> json) =>
    TimeIntervalDto(
      available: json['available'] as bool,
      endEt: json['end_at'] as String,
      startAt: json['start_at'] as String,
    );

Map<String, dynamic> _$TimeIntervalDtoToJson(TimeIntervalDto instance) =>
    <String, dynamic>{
      'start_at': instance.startAt,
      'end_at': instance.endEt,
      'available': instance.available,
    };
