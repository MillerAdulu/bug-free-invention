part of holiday_utils;

class HolidayValues {
  HolidayValues({
    required this.apiURL,
  });

  final String apiURL;
}

class HolidayConfig {
  factory HolidayConfig({required HolidayValues values}) {
    return _instance ??= HolidayConfig._internal(values);
  }

  HolidayConfig._internal(this.values);

  final HolidayValues values;
  static HolidayConfig? _instance;

  static HolidayConfig? get instance => _instance;
}
