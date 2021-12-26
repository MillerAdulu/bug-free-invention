part of 'list_holidays_cubit.dart';

@freezed
class ListHolidaysState with _$ListHolidaysState {
  const factory ListHolidaysState.initial() = _Initial;
  const factory ListHolidaysState.loading() = _Loading;
  const factory ListHolidaysState.loaded(List<LocalHoliday> holidays) = _Loaded;
  const factory ListHolidaysState.error(String message) = _Error;
}
