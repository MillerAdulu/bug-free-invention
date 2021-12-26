import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holidays/features/_graphql.dart';
import 'package:holidays/models/local/_index.dart';
import 'package:holidays/services/_index.dart';

part 'list_holidays_state.dart';
part 'list_holidays_cubit.freezed.dart';

class ListHolidaysCubit extends Cubit<ListHolidaysState> {
  ListHolidaysCubit({
    required HolidayService holidayService,
  }) : super(ListHolidaysState.initial()) {
    _holidayService = holidayService;
  }

  late HolidayService _holidayService;

  Future listHolidays() async {
    emit(ListHolidaysState.loading());
    try {
      final List<LocalHoliday> _holidays =
          await _holidayService.listHolidays(HolidaySchema.listHolidays());
      emit(ListHolidaysState.loaded(_holidays));
    } on Failure catch (e) {
      emit(ListHolidaysState.error(e.message));
    } catch (e) {
      emit(ListHolidaysState.error(e.toString()));
    }
  }
}
