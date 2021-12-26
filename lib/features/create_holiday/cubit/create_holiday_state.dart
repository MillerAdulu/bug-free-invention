part of 'create_holiday_cubit.dart';

@freezed
class CreateHolidayState with _$CreateHolidayState {
  const factory CreateHolidayState.initial() = _Initial;
  const factory CreateHolidayState.loading() = _Loading;
  const factory CreateHolidayState.loaded(bool success) = _Loaded;
  const factory CreateHolidayState.error(String message) = _Error;
}
