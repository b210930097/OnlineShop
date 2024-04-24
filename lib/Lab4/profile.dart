import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/image/1330318.png"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileImage(),
                _buildProfileStatus(),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _followers('1', 'Followers'),
            _followers('1', 'Following'),
            _followers('1', 'Likes'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buttonEdit('Edit profile'),
            _buttonEdit('Add friend'),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 68),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Photos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  )),
              Text("Likes",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 22, right: 22),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 350,
          width: double.infinity,
          child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(11),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    _postImage("assets/image/pro1.jpeg"),
                    _postImage("assets/image/pro2.jpeg"),
                    _postImage("assets/image/pro3.jpeg"),
                    _postImage("assets/image/pro4.jpeg"),
                    _postImage("assets/image/pro5.jpeg"),
                    _postImage("assets/image/pro6.jpeg"),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}

Widget _buildProfileImage() {
  return SizedBox(
    width: 100,
    height: 100,
    child: ClipOval(
      child: Image.asset(
        "assets/image/profile.jpg",
        fit: BoxFit.fitWidth,
      ),
    ),
  );
}

Widget _buildProfileStatus() {
  return Container(
    width: 200,
    height: 104,
    color: const Color.fromRGBO(74, 77, 165, 1),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Tuguldur',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Mongolia\nErdenet',
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

Widget _followers(String number, String text) {
  return Padding(
    padding: const EdgeInsets.all(17),
    child: Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}

Widget _buttonEdit(String text) {
  return SizedBox(
    height: 40,
    width: 156,
    child: ElevatedButton(
      onPressed: null,
      child: Text(text),
    ),
  );
}

Widget _postImage(String image) {
  return Container(
    padding: const EdgeInsets.all(2),
    child: Image.asset(
      image,
    ),
  );
}
