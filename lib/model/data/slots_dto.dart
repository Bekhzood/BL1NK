import 'package:json_annotation/json_annotation.dart';

part 'slots_dto.g.dart';

@JsonSerializable()
class SlotsDto {
  @JsonKey(name: 'data')
  List<TimeIntervalDto> data;

  SlotsDto({required this.data});

  factory SlotsDto.fromJson(Map<String, dynamic> json) =>
      _$SlotsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SlotsDtoToJson(this);
}

@JsonSerializable()
class TimeIntervalDto {
  @JsonKey(name: 'start_at')
  final String startAt;
  @JsonKey(name: 'end_at')
  final String endEt;
  final bool available;

  TimeIntervalDto(
      {required this.available, required this.endEt, required this.startAt});

  factory TimeIntervalDto.fromJson(Map<String, dynamic> json) =>
      _$TimeIntervalDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TimeIntervalDtoToJson(this);
}
