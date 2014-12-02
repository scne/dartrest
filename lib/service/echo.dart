library echo;

import 'dart:async';

import 'echoresponse.dart';
import 'package:angular/angular.dart';

@Injectable()
class EchoService {
  String _serverUrl = 'http://127.0.0.1:8080/json';

  Future _loaded;

  String _echoJson;

  final Http _http;

  EchoService(Http this._http) {
    _loaded = Future.wait([_loadRecipes()]);
  }

  Future _loadRecipes() {
    return _http.get(_serverUrl)
      .then((HttpResponse response) {
      EchoResponse r = new  EchoResponse.fromJson(response.data); 
        _echoJson = r.dateTime +' '+ r.random;
      });
  }

  Future getEcho(){
    return _echoJson == null
            ? _loaded.then((_) => _echoJson)
            : new Future.value(_echoJson);
  }
 
}