import 'package:flutter/material.dart';
import 'package:online_shop/pages/home.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final String? name;
  late final String? email;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                child: Image.asset("assets/image/login.png"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                'TH',
                style: TextStyle(fontFamily: 'MySoul', fontSize: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Center(
                child: _buildLoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildLoginForm() {
    return Container(
      color: Color.fromARGB(150, 255, 255, 255),
      width: double.infinity,
      height: 270,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Нэвтрэх нэр'),
                validator: (text) => text!.isEmpty ? 'Нэрээ оруулна уу!' : null,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Э-мэйл'),
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Э-мэйлээ оруулна уу!';
                  }
                  final regex = RegExp('[^@]+@[^\.]+\..+');
                  if (!regex.hasMatch(text)) {
                    return 'Э-мэйлээ зөв эсэхийг шалгана уу?';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validate,
                child: const Text('Нэврэх'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }

    Navigator.of(context).pushReplacementNamed(
      Home.route,
      arguments: {name = _nameController.text, email = _emailController.text},
    );
  }
}
