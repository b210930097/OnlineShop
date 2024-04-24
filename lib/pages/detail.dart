import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Detail extends StatefulWidget {
  final String code;
  final String price;

  const Detail({Key? key, required this.code, required this.price})
      : super(key: key);
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.code,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icon/leftArrow.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                child: Image.asset("assets/image/login.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
