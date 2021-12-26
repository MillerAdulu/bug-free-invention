part of holiday_services;

abstract class HolidayService {
  Future<LocalHoliday> createHoliday(MutationOptions createHolidayOptions);
  Future<List<LocalHoliday>> listHolidays(QueryOptions listHolidayOptions);
}

class HolidayServiceImpl implements HolidayService{ 
  @override
  Future<LocalHoliday> createHoliday(MutationOptions createHolidayOptions)async {
    try {
      final _res = await _graphQLUtil.mutationRequest(createHolidayOptions);

      // Probably needs to be relooked. Doesn't look so nice and well thought out
      // Idea is to manipulate and return custom to local
      // Alternative: Return remote type the localize in cubit
      return LocalHoliday.fromJson(
          RemoteCreateHolidayResponse.fromJson(_res).createDay.toJson(),);
    } on Failure {
      rethrow;
    }
  }

  @override
  Future<List<LocalHoliday>> listHolidays(QueryOptions listHolidayOptions) async{
    try {
      final _res = await _graphQLUtil.queryRequest(listHolidayOptions);

// Probably needs to be relooked. Doesn't look so nice and well thought out
// Idea is to manipulate and return custom to local
      // Alternative: Return remote type the localize in cubit
      return LocalHolidays.fromJson(
              RemoteListHolidaysResponse.fromJson(_res).toJson()).listDays
          ;
    } on Failure {
      rethrow;
    }
  }
}
