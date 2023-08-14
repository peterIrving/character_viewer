import 'package:characters_coding_test/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  const environment = String.fromEnvironment(
    'FLAVOR',
  );

  await dotenv.load(fileName: '.env.$environment');

  final apiUrl = dotenv.env['API_URL'];
  final appName = dotenv.env['APP_TITLE'];

  if (apiUrl == null || appName == null) {
    throw Exception('Missing config values');
  }

  final appConfig = AppConfig(appName, Uri.parse(apiUrl));

  runApp(MyApp(
    config: appConfig,
  ));
}
