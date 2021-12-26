part of holiday_local_models;

// Base Models
@freezed
class LocalHoliday with _$LocalHoliday {
  factory LocalHoliday(
    String uuid,
    String name,
    String day,
    String createdAt,
    String updatedAt,
  ) = _LocalHoliday;

  factory LocalHoliday.fromJson(Map<String, dynamic> json) =>
      _$LocalHolidayFromJson(json);
}

@freezed
class LocalHolidays with _$LocalHolidays {
  factory LocalHolidays(
    List<LocalHoliday> listDays,
  ) = _LocalHolidays;

  factory LocalHolidays.fromJson(Map<String, dynamic> json) =>
      _$LocalHolidaysFromJson(json);
}

@freezed
class CreateHolidayDTO with _$CreateHolidayDTO {
  factory CreateHolidayDTO({
    required String name,
    required String day,
  }) = _CreateHolidayDTO;

  factory CreateHolidayDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateHolidayDTOFromJson(json);
}
