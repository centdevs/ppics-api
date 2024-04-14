import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ppics/api/category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var title = Get.arguments.toString().replaceAll("/", "");
    var fLetter = title[0].toUpperCase();
    var rems = title.substring(1, title.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$fLetter$rems",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 1, 10, 5),
          child: FutureBuilder(
            future: getCategory(href: Get.arguments),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return MasonryGridView.builder(
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: snapshot.data.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return _buildCard(item: snapshot.data[index]);
                  },
                );
              } else {
                return const Center(
                  child: Text("Loading..."),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard({item}) {
    return InkWell(
      onTap: () => Get.toNamed('/gallery', arguments: {
        "href": item.href,
        "title": item.title,
      }),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(item.coverImage),
          ),
        ],
      ),
    );
  }
}
