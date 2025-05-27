import 'package:flutter/material.dart';

class DetailAnggotaPage extends StatelessWidget {
  final String nama;
  final String kelas;
  final String foto;
  final bool defaultPengikut;

  const DetailAnggotaPage({
    super.key,
    required this.nama,
    required this.kelas,
    required this.foto,
    this.defaultPengikut = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142C57),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          nama,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            CircleAvatar(radius: 50, backgroundImage: AssetImage(foto)),
            const SizedBox(height: 20),
            Text(nama, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(kelas, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 20),
            Text(
              defaultPengikut ? 'Status: Pengikut' : 'Status: Mengikuti',
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}