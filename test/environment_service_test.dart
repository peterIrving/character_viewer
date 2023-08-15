import 'package:characters_coding_test/services/environment_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

main() {
  final mockDotEnv = MockDotEnv();

  test('environment service test success', () async {
    when(() => mockDotEnv.load(fileName: any(named: "fileName")))
        .thenAnswer((_) => Future.value());

    when(() => mockDotEnv.env).thenReturn({
      'API_URL': 'https://api.example.com',
      'APP_TITLE': 'Test App',
    });

    final environmentService = EnvironmentService(
      flavor: 'testFlavor',
      dotEnv: mockDotEnv,
    );
    final config = await environmentService.getAppConfig();

    expect(config.title, 'Test App');
    expect(config.apiURL, Uri.parse('https://api.example.com'));
  });

  // failure test
  test('environment service test fails when environment file not found',
      () async {
    when(() => mockDotEnv.load(fileName: any(named: "fileName")))
        .thenThrow(Exception('error'));

    final environmentService = EnvironmentService(
      flavor: 'testFlavor',
      dotEnv: mockDotEnv,
    );

    expect(
      () async => await environmentService.getAppConfig(),
      throwsException,
    );
  });

  //fails whe missing config values
  test('environment service test fails when missing config values', () async {
    when(() => mockDotEnv.load(fileName: any(named: "fileName")))
        .thenAnswer((_) => Future.value());

    when(() => mockDotEnv.env).thenReturn({});

    final environmentService = EnvironmentService(
      flavor: 'testFlavor',
      dotEnv: mockDotEnv,
    );

    expect(
      () async => await environmentService.getAppConfig(),
      throwsException,
    );
  });
}
