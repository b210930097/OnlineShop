import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 235, 235, 235),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: _buildProfileImage(),
            ),
            const Text(
              'Өөрчлөх',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 88),
            _buildProfileStatus(
                context, 'Нэр', 'Б. Төгөлдөр', () => Placeholder()),
            SizedBox(height: 28),
            _buildProfileStatus(
                context, 'И-мэйл ', 'admin@gmail.com', () => Placeholder()),
            SizedBox(height: 28),
            _buildProfileStatus(
                context, 'Хүйс', 'Эрэгтэй', () => Placeholder()),
            SizedBox(height: 28),
            _buildProfileStatus(
                context, 'Нууц үг', '*****', () => Placeholder()),
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

  Widget _buildProfileStatus(BuildContext context, String type, String label,
      Widget Function() pageBuilder) {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type,
              style: const TextStyle(fontSize: 24),
            ),
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
