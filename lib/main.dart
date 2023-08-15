import 'package:characters_coding_test/my_app.dart';
import 'package:flutter/material.dart';

import 'services/environment_service.dart';

void main() async {
  final environmentService = EnvironmentService.init();
  final appConfig = await environmentService.getAppConfig();

  runApp(MyApp(
    config: appConfig,
  ));
}
