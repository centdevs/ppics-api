import "dart:convert";

import "package:http/http.dart" as http;
import "package:ppics/vars.dart";

class Gallery {
  final String title;
  final String href;
  final String coverImage;

  Gallery({
    required this.title,
    required this.href,
    required this.coverImage,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      title: json['title'],
      href: json['href'],
      coverImage: json['cover_image'],
    );
  }
}

Future<List<Gallery>> getCategory({href}) async {
  try {
    var body = jsonEncode({"path": href});
    var response = await http.post(
      Uri.parse(Vars.tagsUrl),
      headers: <String, String>{
        "Content-Type": "application/json",
      },
      body: body,
    );
    if (response.statusCode == 200) {
      List<Gallery> galleries = [];
      var jsonBody = jsonDecode(response.body);
      for (var galleryJson in jsonBody['galleries']) {
        galleries.add(Gallery.fromJson(galleryJson));
      }
      return galleries;
    } else {
      // Handle HTTP error
      print('Failed to load galleries: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    // Handle network exception
    print('Exception caught: $e');
    return [];
  }
}
