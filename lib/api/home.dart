import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ppics/vars.dart';

class Category {
  final String title;
  final String href;
  final String coverImage;

  Category({
    required this.title,
    required this.href,
    required this.coverImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'],
      href: json['href'],
      coverImage: json['cover_image'],
    );
  }
}

Future<List<Category>> get_home_pics() async {
  try {
    var response = await http.get(Uri.parse(Vars.homeUrl));
    if (response.statusCode == 200) {
      List<Category> categories = [];
      var jsonBody = jsonDecode(response.body);
      for (var categoryJson in jsonBody['categories']) {
        categories.add(Category.fromJson(categoryJson));
      }
      return categories;
    } else {
      // Handle HTTP error
      print('Failed to load data: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    // Handle network exception
    print('Exception caught: $e');
    return [];
  }
}
