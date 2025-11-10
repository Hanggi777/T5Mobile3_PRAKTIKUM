import 'package:flutter/material.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigasi Flutter',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar produk (tambahkan 1 merek hp baru)
    final List<Map<String, String>> products = [
      {
        'title': 'Laptop Pro',
        'image': 'assets/laptop.jpeg',
        'desc': 'Laptop Pro dengan prosesor i7 dan RAM 16GB untuk performa maksimal.'
      },
      {
        'title': 'Smartphone Iphone X',
        'image': 'assets/smartphone_x.jpeg',
        'desc': 'Smartphone Iphone X dengan layar AMOLED 6.5 inci dan kamera 108MP.'
      },
      {
        'title': 'Headphone Air',
        'image': 'assets/headphone.jpeg',
        'desc': 'Headphone nirkabel dengan peredam bising aktif dan baterai tahan lama.'
      },
      {
        'title': 'Smartphone Samsung Z',
        'image': 'assets/smartphone_z.jpeg',
        'desc': 'Smartphone Samsung Z dengan chipset terbaru dan fitur pengisian cepat 120W.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product['image']!, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(product['title']!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    itemTitle: product['title']!,
                    itemImage: product['image']!,
                    itemDesc: product['desc']!,
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
