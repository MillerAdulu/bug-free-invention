part of holiday_utils;

class Singletons {
  static final HolidayService _holidayService = HolidayServiceImpl();
  
  static List<BlocProvider> registerCubits() => [];
}
