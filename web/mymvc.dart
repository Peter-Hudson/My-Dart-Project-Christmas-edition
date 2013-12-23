library mymvc;

import 'package:angular/angular.dart';

class ServerController {
  Http _http;

  ServerController(Http this._http);

  init(MymvcController mvc) {
    _http(method: 'GET', url: '/index').then((HttpResponse data) {
      print(data.toString());
    });
  }
}

@NgController(
  selector: '[mymvc-controller]',
  publishAs: 'mymvc'
)

class MymvcController {

}

