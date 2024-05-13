import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/models/product.dart';
import 'package:online_shop/components/product.dart';

class CategoryShow extends StatefulWidget {
  final String category;
  final List<String> categoryList;

  CategoryShow({required this.category, required this.categoryList});

  @override
  State<CategoryShow> createState() => _CategoryShowState();
}

class _CategoryShowState extends State<CategoryShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('product')
            .where('category', isEqualTo: widget.category)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: GridView.count(
              crossAxisSpacing: 17,
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return ProductShow(
                    context: context, product: Product.fromFirestore(document));
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
