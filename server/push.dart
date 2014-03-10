import 'package:vane/vane.dart';

class Push extends Controller {
  void main() {
    List<int> resBuffer = new List<int>();
    
    print("Got request");
    print("Method: ${req.method}");
    print("Content type: ${req.headers.contentType}");
    print("Content length: ${req.headers.contentLength}");
    print("Url paramters:");
    query.forEach((key, val) {
      print("Key = $key");
      print("Val = $val");
    });
    
    var r = req.listen(null);
    
    r.onData((data) => resBuffer.addAll(data));
    r.onDone(() {
      print("Data:");
      print(new String.fromCharCodes(resBuffer));
      print("</br>");
      print("----------------------------------------------------");
      print("</br>");
      send(new String.fromCharCodes(resBuffer));
    });
  }
}