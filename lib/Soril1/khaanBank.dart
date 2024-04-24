import 'package:flutter/material.dart';

class KhaanBank extends StatelessWidget {
  const KhaanBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Тусламж',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'English',
                    style: TextStyle(color: Colors.black),
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                ),
              ],
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/image/profile.jpg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Сайна байна уу,',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Төгөлдөр',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.fingerprint,
                              ),
                            ),
                            Text(
                              'Нэвтрэх',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(0, 124, 72, 1)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Шинэ хэрэглэгчээр нэвтрэх',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Нэвтрэх нэр, нууц үгээ мартсан уу?',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
