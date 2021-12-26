# Holidays

Created for purposes of seeing how to use graphql in a manner that promotes separation of concern in Flutter applications.

API Code: https://github.com/MillerAdulu/shiny-octo-barnacle
API URL: https://app-holidays.herokuapp.com/graphiql
APK Available in the artifacts section
---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ make gen && flutter run --flavor development --target lib/main_development.dart

# Staging
$ make gen && flutter run --flavor staging --target lib/main_staging.dart

# Production
$ make gen && flutter run --flavor production --target lib/main_production.dart
```

_\*Holidays works on iOS, Android, and Web._

---