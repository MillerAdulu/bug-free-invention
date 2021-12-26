part of holiday_utils;

class Singletons {
  static final HolidayService _holidayService = HolidayServiceImpl();

  static List<BlocProvider> registerCubits() => [
        BlocProvider<ListHolidaysCubit>(
          create: (context) => ListHolidaysCubit(
            holidayService: _holidayService,
          ),
        ),
        BlocProvider<CreateHolidayCubit>(
          create: (context) => CreateHolidayCubit(
            holidayService: _holidayService,
          ),
        ),
      ];
}
