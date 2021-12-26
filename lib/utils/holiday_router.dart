part of holiday_utils;

class HolidayRouter {
  static const String landingRoute = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final _args = settings.arguments;

    switch (settings.name) {
      case landingRoute:
        return _route(ListHolidayPage());
      default:
        return _route(
          Scaffold(
            appBar: AppBar(
              title: const Text('Holidays'),
            ),
            body: const Center(
              child: Text('Unknown page'),
            ),
          ),
        );
    }
  }

  static Route _route(Widget page) =>
      CupertinoPageRoute<dynamic>(builder: (context) {
        return page;
      });
}
