library dartrest;

import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:logging/logging.dart';
import 'package:forcemvc/force_mvc.dart';
import 'package:wired/wired.dart';
import 'package:mustache4dart/mustache4dart.dart';
import 'package:appengine/appengine.dart';

part 'controllers/count_controller.dart';
part 'controllers/model/foo.dart';

part 'controllers/security/session_strategy.dart';

void main() {
  
  // Create a force server 
  WebApplication webApp = new WebApplication();
  
  runAppEngine(webApp.requestHandler).then((_){
    // register yaml files
     webApp.loadValues("../app.yaml");
    //  server.loadValues("pubspec.yaml");
     webApp.notFound((ForceRequest req, Model model) {
       return "notfound";
     });
     
     // Set up logger.
     webApp.setupConsoleLog(Level.FINEST);
     
     // Setup session strategy
     webApp.strategy = new SessionStrategy();
     
     if (webApp.viewRender is MustacheRender) {
              MustacheRender mustacheRender = webApp.viewRender;
              mustacheRender.delimiter = new Delimiter('[[', ']]');
          }
     
     // Serve the view called index as default 
     webApp.use("/", (req, model) => "index");
  });
  
 
}