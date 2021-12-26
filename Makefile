icons:
		flutter pub run flutter_launcher_icons:main

splash:
		flutter pub run flutter_native_splash:create

gen:
		flutter packages run build_runner build --delete-conflicting-outputs

fmt:
		flutter format lib test

apk:
		flutter build apk  --flavor production --target lib/main_production.dart


aab:
		flutter build appbundle  --flavor production --target lib/main_production.dart

run:
		flutter run --release  --flavor production --target lib/main_production.dart
	
build: 	# Run the app on a new computer with Flutter 2.3 installed
		flutter pub get && make gen && make run