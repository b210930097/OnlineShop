import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/components/product_list.dart';
import 'package:online_shop/components/search_bar.dart';
import 'package:online_shop/components/sort.dart';
import 'package:online_shop/pages/category.dart';
import 'package:online_shop/pages/profile.dart';

class Home extends StatefulWidget {
  static const route = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? searchQuery;
  int totalAmount = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> categoryList = [
    'Малгай',
    'Даашинз',
    'Цамц',
    'Өмд',
    'Гутал',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        leading: IconButton(
          icon: SvgPicture.asset('assets/icon/menu.svg'),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icon/user.svg'),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 93, 93),
                Color.fromARGB(255, 245, 211, 211),
                Colors.white,
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100, left: 18, bottom: 56),
                child: Text('Төрөл',
                    style: TextStyle(fontFamily: 'Jaldi', fontSize: 50)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36),
                child: Column(
                  children: [
                    for (var item in categoryList)
                      ListTile(
                        title: Text(item),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CategoryShow(
                                category: item,
                                categoryList: categoryList,
                              ),
                            ),
                          );
                          setState(() {});
                        },
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(color: Colors.black),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Тавтай морил',
                            style:
                                TextStyle(fontFamily: 'Jaldi', fontSize: 24)),
                        const SizedBox(height: 38),
                        Search(
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                        ),
                        const SizedBox(height: 38),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Бүх бараа',
                              style: TextStyle(
                                  fontFamily: 'Jaldi',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            Sort()
                          ],
                        ),
                        const SizedBox(height: 16),
                        ProductList(searchQuery: searchQuery)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _buildFooterCart(),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterCart() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            Text(
              'Total: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: clearTotal,
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  void clearTotal() {
    setState(() {
      totalAmount = 0;
    });
  }
}
