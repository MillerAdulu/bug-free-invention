part of holiday_remote_models;

// Base Models
@freezed
class RemoteHoliday with _$RemoteHoliday {
  factory RemoteHoliday(
    String uuid,
    String name,
    String date,
    String createdAt,
    String updatedAt,
  ) = _RemoteHoliday;

  factory RemoteHoliday.fromJson(Map<String, dynamic> json) =>
      _$RemoteHolidayFromJson(json);
}

// Operation Models
@freezed
class RemoteCreateHolidayResponse with _$RemoteCreateHolidayResponse {
  factory RemoteCreateHolidayResponse(
    @JsonKey(name: '__typename') String typeName,
    RemoteHoliday createDay,
  ) = _RemoteCreateHolidayResponse;

  factory RemoteCreateHolidayResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteCreateHolidayResponseFromJson(json);
}

@freezed
class RemoteListHolidaysResponse with _$RemoteListHolidaysResponse {
  factory RemoteListHolidaysResponse(
    @JsonKey(name: '__typename') String typeName,
    List<RemoteHoliday> listDays,
  ) = _RemoteListHolidaysResponse;

  factory RemoteListHolidaysResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteListHolidaysResponseFromJson(json);
}
