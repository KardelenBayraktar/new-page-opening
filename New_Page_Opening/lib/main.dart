import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower List',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key}); // super.key

  static const List<String> items = [
    'Snowdrop',
    'Daisy',
    'Violet',
    'Rose',
    'Lavender',
    "Butcher's Broom",
    'Lily',
    'Hydrangea',
    'Jasmine',
    'Orchid'
  ];

  static const List<String> imagePaths = [
    'lib/assets/snowdrop.jpeg',
    'lib/assets/daisy.jpeg',
    'lib/assets/violett.jpeg',
    'lib/assets/rose.jpeg',
    'lib/assets/lavender.jpeg',
    'lib/assets/butchersbroom.jpeg',
    'lib/assets/lily.jpeg',
    'lib/assets/Hydrangea.jpeg',
    'lib/assets/jasmine.jpeg',
    'lib/assets/orchid.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flower List',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index],
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    item: items[index],
                    imagePath: imagePaths[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String item;
  final String imagePath;

  const DetailPage({
    super.key, // super.key
    required this.item,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 20),
            Text(
              'You selected: $item',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
