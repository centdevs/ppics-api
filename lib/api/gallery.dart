import "dart:convert";

import "package:http/http.dart" as http;
import "package:ppics/vars.dart";

Future<dynamic> getGallery({href}) async {
  var res = await http.post(
    Uri.parse(Vars.galleryUrl),
    headers: <String, String>{
      "Content-Type": "application/json",
    },
    body: jsonEncode({"path": href}),
  );
  var jsonBody = jsonDecode(res.body)['images'];
  return jsonBody;
}
