import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/pages/profileSettings.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        // Using a custom back icon
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded, // Replace with your custom icon
            color: Colors.black, // Customize icon color
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 235, 235, 235),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _buildProfileImage(),
            ),
            const Text(
              'Б. Төгөлдөр',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 50),
            _buildProfileStatus(
                context,
                SvgPicture.asset('assets/icon/user.svg'),
                'Хувийн мэдээлэл',
                () => const ProfileSettings()),
            SizedBox(height: 28),
            _buildProfileStatus(
                context,
                SvgPicture.asset('assets/icon/user.svg'),
                'Хадгалсан',
                () => const Placeholder()),
            SizedBox(height: 28),
            _buildProfileStatus(
                context,
                SvgPicture.asset('assets/icon/user.svg'),
                'Гарах',
                () => const Placeholder()),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return SizedBox(
      width: 100,
      height: 100,
      child: ClipOval(
        child: Image.asset(
          "assets/image/pro2.jpeg",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _buildProfileStatus(BuildContext context, SvgPicture icon,
      String label, Widget Function() pageBuilder) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => pageBuilder()),
          );
          setState(() {});
        },
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
