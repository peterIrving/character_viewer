import 'package:characters_coding_test/data/app_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentService {
  final String flavor;
  final DotEnv dotEnv;

  /// Use directly for testing
  EnvironmentService({
    required this.flavor,
    required this.dotEnv,
  });

  /// Used within application
  factory EnvironmentService.init() {
    const environment = String.fromEnvironment(
      'FLAVOR',
    );

    return EnvironmentService(
      flavor: environment,
      dotEnv: dotenv,
    );
  }

  Future<AppConfig> getAppConfig() async {
    await dotEnv.load(fileName: '.env.$flavor');
    final apiUrl = dotEnv.env['API_URL'];
    final appName = dotEnv.env['APP_TITLE'];

    if (apiUrl == null || appName == null) {
      throw Exception('Missing config values');
    }

    return AppConfig(appName, Uri.parse(apiUrl));
  }
}
