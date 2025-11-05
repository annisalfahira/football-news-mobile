import 'package:flutter/material.dart';
import 'package:football_news/screens/newslist_form.dart';

// Widget ini adalah versi "ItemCard" yang sudah dipindahkan (refactor) ke folder widgets
class ItemCard extends StatelessWidget {
  final _MenuItem item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        // Area responsif terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik (sesuai instruksi navigasi tombol)
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
            );

          // Mengisi TODO di tutorial:
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Add News") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewsFormPage()),
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item.icon, size: 48),
                const SizedBox(height: 8),
                Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Helper kecil untuk daftar item di menu (nama + ikon)
class _MenuItem {
  final String name;
  final IconData icon;
  const _MenuItem({required this.name, required this.icon});
}

// Ekspor list contoh item (agar bisa dipakai di menu.dart seperti pada tutorial sebelumnya)
const List<_MenuItem> kMenuItems = [
  _MenuItem(name: 'Add News', icon: Icons.post_add),
  _MenuItem(name: 'Dummy Button', icon: Icons.list_alt),
];
