import 'package:cloud_firestore/cloud_firestore.dart';

import '../../dummy_data.dart';

final CollectionReference productsCollection =
FirebaseFirestore.instance.collection('products');
Future<void> uploadData() async {
  for (var data in dataList) {
    await productsCollection.add(data);
  }
  print('Data uploaded to FireStore successfully!');
}