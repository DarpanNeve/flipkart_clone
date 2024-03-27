import 'package:flutter/material.dart';

import 'firebase.dart';

AppBar homePageAppBar() {
  return AppBar(
    title: const Text("Flipkart"),
    bottomOpacity: 0.5,
    actions: [
      IconButton(
        onPressed: () {
          uploadData();
        },
        icon: const Icon(Icons.upload),
      ),
    ],
  );
}