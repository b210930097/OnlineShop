import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/models/product.dart';
import 'package:online_shop/components/product.dart';

class ProductList extends StatelessWidget {
  final String? searchQuery;
  const ProductList({required this.searchQuery, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('product').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final String query = searchQuery ?? '';
        List<DocumentSnapshot> filteredDocs =
            snapshot.data!.docs.where((document) {
          String productName = document['name'].toString().toLowerCase();
          return productName.contains(query.toLowerCase());
        }).toList();

        return filteredDocs.isEmpty
            ? const SizedBox(
                height: 330,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Олдсонгүй.',
                    style: TextStyle(
                        fontFamily: 'Jaldi',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : SizedBox(
                height: 330,
                width: double.infinity,
                child: GridView.count(
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 30,
                  crossAxisCount: 2,
                  children: filteredDocs.map((DocumentSnapshot document) {
                    return ProductShow(
                        context: context,
                        product: Product.fromFirestore(document));
                  }).toList(),
                ),
              );
      },
    );
  }
}
