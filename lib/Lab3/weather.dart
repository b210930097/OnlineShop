import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  int i = 0;

  List<List<Color>> color = [
    [Colors.yellow, Colors.orange],
    [Colors.white, Colors.blue],
    [
      const Color.fromARGB(147, 203, 125, 255),
      const Color.fromARGB(255, 132, 0, 255)
    ],
    [Colors.blue, Colors.lightBlue],
  ];
  List<String> temp = ['30°', '8°', '12°', '-2°'];
  List<String> image = [
    'assets/image/sun.png',
    'assets/image/snow.png',
    'assets/image/cloud.png',
    'assets/image/rain.png'
  ];

  refresh() {
    color[i];
    i == 3 ? i = -1 : i = i;
    setState(() {
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: color[i],
          ),
        ),
        child: Center(
          child: SafeArea(
              child: Column(
            children: [
              const Text('Erdenet',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              const Text('Mon 12:00',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(
                temp[i],
                style: const TextStyle(
                    fontSize: 150,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              Image.asset(image[i]),
              const Spacer(),
              SizedBox(
                height: 150,
                width: 150,
                child: ElevatedButton(
                  onPressed: () => refresh(),
                  child: Image.asset('assets/image/refresh.png'),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
