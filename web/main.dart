library dartrest;

import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';

import 'package:dartrest/component/custom.dart';
import 'package:dartrest/service/echo.dart';

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