import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppics/api/gallery.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${Get.arguments['title']}",
          overflow: TextOverflow.fade,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 10, 1),
        child: FutureBuilder(
          future: getGallery(href: Get.arguments['href']),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        // if (index == 0) {
                        //   return Column(
                        //     children: [
                        //       Text("${Get.arguments['title']}"),
                        //       Padding(
                        //         padding: const EdgeInsets.only(bottom: 6),
                        //         child: ClipRRect(
                        //           borderRadius: BorderRadius.circular(10),
                        //           child: Image.network(snapshot.data[0]),
                        //         ),
                        //       )
                        //     ],
                        //   );
                        // }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(snapshot.data[index]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("Loading..."),
              );
            }
          },
        ),
      ),
    );
  }
}
