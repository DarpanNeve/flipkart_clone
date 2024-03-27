import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipkart_clone/pages/home_page/home_page_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../dummy_data.dart';
import '../../theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homePageAppBar(),
        body: Column(
          children: [
            SafeArea(
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Theme.of(context).appBarTheme.backgroundColor,
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CarouselSlider(
                            items: dataList.map((e) {
                              return CachedNetworkImage(
                                imageUrl: e["image"],
                                fit: BoxFit.cover,
                              );
                            }).toList(),
                            options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Top Categories",
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 175,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data!.docs[index]["image"],
                                              height: 100,
                                              width: 100,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ["title"],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(snapshot
                                                .data!.docs[index]["price"]
                                                .toString()),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Text(
                        "Top Products",
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.start,
                      ),

                      Text(
                        "Seasonal Pick",
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }
}
