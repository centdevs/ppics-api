import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppics/pages/category.dart';
import 'package:ppics/pages/gallery.dart';
import 'package:ppics/pages/home.dart';

void main() {
  return runApp(
    GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "worksans",
      ),
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        GetPage(name: '/category', page: () => const CategoryPage()),
        GetPage(name: '/gallery', page: () => const GalleryPage()),
      ],
    ),
  );
}
