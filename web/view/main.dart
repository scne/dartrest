library dartrest;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';

import '../lib/component/custom.dart';
import '../lib/service/echo.dart';

class MyAppModule extends Module {
  MyAppModule() {
    bind(CustomComponent);
    bind(EchoService);
  }
}

void main() {
  Logger.root..level = Level.FINEST
             ..onRecord.listen((LogRecord r) { print(r.message); });

  applicationFactory()
      .addModule(new MyAppModule())
      .run();
}