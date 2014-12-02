library custom;

import 'package:angular/angular.dart';
import 'package:dartrest/service/echo.dart';


/* The selector field defines the CSS selector that will trigger the component. It can be any valid
 * CSS selector which does not cross element boundaries.
 *
 * The component's public fields are available for data binding from the view.
 * Similarly, the component's public methods can be invoked from the view.
 */
@Component(
    selector: 'custom',
    templateUrl: 'custom.html')
class CustomComponent {

  static const String LOADING_MESSAGE = "Loading recipe book...";
  static const String ERROR_MESSAGE = "Sorry! The cook stepped out of the"
      "kitchen and took the recipe book with him!";

  final Http _http;
  final EchoService echoService;
  
  String echo;

  // Determine the initial load state of the app
  String message = LOADING_MESSAGE;
  bool echosLoaded = false;


  CustomComponent(this._http, this.echoService) {
    _loadData();
  }


  void _loadData() {
    echoService.getEcho()
      .then((String response) {
        echo = response;
        echosLoaded = true;
      })
      .catchError((e) {
        print(e);
        echosLoaded = false;
        message = ERROR_MESSAGE;
      });
  }
}