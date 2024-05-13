import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/models/product.dart';
import 'package:online_shop/pages/detail.dart';

class ProductShow extends StatefulWidget {
  final BuildContext context;
  final Product product;
  const ProductShow({required this.context, required this.product, super.key});

  @override
  State<ProductShow> createState() => _ProductShowState();
}

class _ProductShowState extends State<ProductShow> {
  int totalAmount = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Detail(
            name: widget.product.name!,
            code: widget.product.code!,
            price: widget.product.price!,
            image: widget.product.image!,
          ),
        ));
      },
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Center(child: Image.network(widget.product.image!)),
            Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await toggleFavorite(widget.product);
                        },
                        icon: Icon(
                          widget.product.favorite!
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.purple,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          addToTotal(widget.product.price!);
                        },
                        icon: Icon(
                          Icons.shopping_cart,
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
                            widget.product.name!,
                            style: TextStyle(
                                fontFamily: 'Jaldi',
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${widget.product.price!}₮",
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

  void addToTotal(int price) {
    setState(() {
      totalAmount += price;
    });
  }
}
