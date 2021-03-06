import 'package:graphql/client.dart';
import 'package:holidays/models/local/_index.dart';

class HolidaySchema {
  static String _createHoliday = r'''
  mutation(
    $name: String!,
    $date: String!
  ){
    createDay(
      name: $name,
      date: $date
    ){
      uuid
      name
      date
      updatedAt
      createdAt
    }
  }
  ''';

  static MutationOptions createHoliday(CreateHolidayDTO createHolidayDTO) {
    return MutationOptions(
      document: gql(_createHoliday),
      variables: createHolidayDTO.toJson(),
      cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
    );
  }

  static String _listHolidays = r'''
  query {
    listDays {
      uuid
      name
      date
      updatedAt
      createdAt
    }
  }
  ''';

  static QueryOptions listHolidays() {
    return QueryOptions(
      document: gql(_listHolidays),
      fetchPolicy: FetchPolicy.cacheAndNetwork, // Needed to force new data
    );
  }
}
