import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holidays/features/_graphql.dart';
import 'package:holidays/models/local/_index.dart';
import 'package:holidays/services/_index.dart';

part 'create_holiday_state.dart';
part 'create_holiday_cubit.freezed.dart';

class CreateHolidayCubit extends Cubit<CreateHolidayState> {
  CreateHolidayCubit({
    required HolidayService holidayService,
  }) : super(CreateHolidayState.initial()) {
    _holidayService = holidayService;
  }

  late HolidayService _holidayService;

  Future createHoliday({
    required String name,
    required String date,
  }) async {
    emit(CreateHolidayState.loading());

    try {
      final _res = await _holidayService.createHoliday(
        HolidaySchema.createHoliday(
          CreateHolidayDTO(
            name: name,
            date: date,
          ),
        ),
      );

      print(_res);

      emit(CreateHolidayState.loaded(true));
    } on Failure catch (e) {
      emit(CreateHolidayState.error(e.message));
    } catch (e) {
      emit(CreateHolidayState.error(e.toString()));
    }
  }
}
