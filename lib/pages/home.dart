import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/pages/profile.dart';
import 'package:online_shop/pages/detail.dart';

class Home extends StatefulWidget {
  static const route = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedValue;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> items = [
    'Үнэтэй',
    'Хямд',
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
                child: Text('Category',
                    style: TextStyle(fontFamily: 'Jaldi', fontSize: 50)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36),
                child: Column(
                  children: [
                    _buildDrawerItem(context, 'Малгай'),
                    _buildDrawerItem(context, 'Даашинз'),
                    _buildDrawerItem(context, 'Цамц'),
                    _buildDrawerItem(context, 'Өмд'),
                    _buildDrawerItem(context, 'Гутал'),
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
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome back',
                            style:
                                TextStyle(fontFamily: 'Jaldi', fontSize: 24)),
                        SizedBox(height: 38),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icon/search.svg'),
                            SizedBox(width: 18),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search product',
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Popular products',
                                style: TextStyle(
                                    fontFamily: 'Jaldi',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                            _buildDropdownMenu(),
                          ],
                        ),
                        SizedBox(height: 16),
                        _buildProductGrid(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _buildFooterCart(), // Add footer cart here
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      onTap: () async {
        await Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Placeholder()));
      },
    );
  }

  Widget _buildDropdownMenu() {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: DropdownButton<String>(
          hint: Text('Эрэмбэлэх'),
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return SizedBox(
      height: 330,
      width: double.infinity,
      child: GridView.count(
        crossAxisSpacing: 17,
        mainAxisSpacing: 30,
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return _postImage(context, "assets/image/pro2.jpeg");
        }),
      ),
    );
  }

  Widget _postImage(BuildContext context, String image) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Detail(code: 'Coat Code #2147', price: '325,000')));
      },
      child: Stack(
        children: [
          Image.asset(image),
          Padding(
            padding: EdgeInsets.all(7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 32,
                      child: Icon(Icons.shopping_cart),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Text(
                          'Coat Code #2147',
                          style: TextStyle(
                              fontFamily: 'Jaldi',
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "325,000₮",
                          style: TextStyle(
                              fontFamily: 'Jaldi',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(85, 85, 85, 100)),
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
              onPressed: () {
                // Handle cart button tap
              },
            ),
            Text(
              'Total: \$0.00',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle checkout button tap
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
