import 'package:flutter/material.dart';

class PengikutPage extends StatelessWidget {
  const PengikutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF142C57),
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Exa Winandya',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      '2 Diikuti',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        '1 Pengikut',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 1,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                PengikutTile(nama: 'Lenora Annie', kelas: 'VIII A', type: 'none'),
                PengikutTile(nama: 'Dinata Lastie', kelas: 'VIII E', type: 'berteman'),
                PengikutTile(nama: 'Exa Winandya', kelas: 'VIII E', type: 'berteman'),
                PengikutTile(nama: 'Cassius Reno', kelas: 'VIII E', type: 'ikuti'),
                PengikutTile(nama: 'Bhaskara Hadrian Athala', kelas: 'VIII E', type: 'ikuti'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PengikutTile extends StatelessWidget {
  final String nama;
  final String kelas;
  final String type;

  const PengikutTile({
    super.key,
    required this.nama,
    required this.kelas,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    Widget actionButton;
    switch (type) {
      case 'berteman':
        actionButton = OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF142C57)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          ),
          child: const Text(
            'Berteman',
            style: TextStyle(color: Color(0xFF142C57)),
          ),
        );
        break;
      case 'ikuti':
        actionButton = ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF142C57),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
          ),
          child: const Text('Ikuti'),
        );
        break;
      default:
        actionButton = const SizedBox.shrink(); // no button
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  kelas,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          actionButton,
        ],
      ),
    );
  }
}
