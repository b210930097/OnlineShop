import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/models/product.dart';
import 'package:online_shop/pages/detail.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Хадгалсан',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _buildProductGrid(),
    );
  }

  Widget _buildProductGrid() {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('product')
          .where('favorite', isEqualTo: true)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final documents = snapshot.data!.docs;
        if (documents.isEmpty) {
          return const Center(
            child: Text(
              'Хоосон байна.',
              style: TextStyle(
                fontFamily: 'Jaldi',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
        return GridView.count(
          crossAxisSpacing: 17,
          mainAxisSpacing: 30,
          crossAxisCount: 2,
          children: documents.map((DocumentSnapshot document) {
            return _postImage(context, Product.fromFirestore(document));
          }).toList(),
        );
      },
    );
  }

  Widget _postImage(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Detail(
            name: product.name!,
            code: product.code!,
            price: product.price!,
            image: product.image!,
          ),
        ));
      },
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Center(child: Image.network(product.image!)),
            Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await toggleFavorite(product);
                        },
                        icon: Icon(
                          product.favorite!
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Text(
                            product.name!,
                            style: TextStyle(
                                fontFamily: 'Jaldi',
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${product.price!}₮",
                            style: TextStyle(
                              fontFamily: 'Jaldi',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> toggleFavorite(Product product) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('product')
        .where('code', isEqualTo: product.code)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      await FirebaseFirestore.instance
          .collection('product')
          .doc(documentSnapshot.id)
          .update({'favorite': !product.favorite!});
      setState(() {
        product.favorite = !product.favorite!;
      });
    }
  }
}
