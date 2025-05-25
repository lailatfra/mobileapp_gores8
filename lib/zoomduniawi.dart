import 'package:flutter/material.dart';
import 'ulasan_widget.dart';

class ZoomDuniawiPage extends StatefulWidget {
  final String imagePath;

  const ZoomDuniawiPage({super.key, required this.imagePath});

  @override
  State<ZoomDuniawiPage> createState() => _ZoomDuniawiPageState();
}

class _ZoomDuniawiPageState extends State<ZoomDuniawiPage> {
  bool isLiked = false;
  final komentarController = TextEditingController();

  void _showReviewBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.65,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ulasan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Divider(thickness: 1, height: 20),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: ulasanList.length,
                      itemBuilder: (context, index) {
                        final ulasan = ulasanList[index];
                        return ulasanTile(
                          nama: ulasan['nama'],
                          komentar: ulasan['komentar'],
                          imageUrl: ulasan['imageUrl'],
                          liked: ulasan['liked'],
                          likeCount: ulasan['likeCount'],
                        );
                      },
                    ),

                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: komentarController,
                          decoration: InputDecoration(
                            hintText: 'Ketik Ulasan',
                            fillColor: Colors.grey[200],
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: const Color(0xFF1D3250),
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                            String komentar = komentarController.text;
                            if (komentar.isNotEmpty) {
                              // Tambahkan logika untuk menyimpan komentar
                              print('Komentar dikirim: $komentar');
                              komentarController.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  final List<Map<String, dynamic>> ulasanList = [
    {
      'nama': 'Lenora Annie',
      'komentar': 'Kalimatnya mudah dibaca',
      'imageUrl': 'assets/profil/exawinandya.png',
      'liked': false,
      'likeCount': 3,
    },
    {
      'nama': 'Dinata Lastie',
      'komentar': 'Bagus',
      'imageUrl': 'assets/profil/dinatalastie.png',
      'liked': true,
      'likeCount': 2,
    },
    {
      'nama': 'Sia Latifa Rahmawati',
      'komentar': 'Pola Kalimatnya indah',
      'imageUrl': 'assets/profil/sialatifarahmawati.png',
      'liked': true,
      'likeCount': 4,
    },
    {
      'nama': 'Ahmad Hafizh',
      'komentar': 'Keren banget fotonya!',
      'imageUrl': 'assets/profil/ahmadhafizh.png',
      'liked': true,
      'likeCount': 5,
    },
    {
      'nama': 'Ayu Lestari',
      'komentar': 'Bikin tenang liatnya',
      'imageUrl': 'assets/profil/ayulestari.png',
      'liked': false,
      'likeCount': 2,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: InteractiveViewer(
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      iconSize: 18,
                      icon: Icon(
                        isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                        color: isLiked ? Color(0xFF142C57) : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: _showReviewBottomSheet,
                      child: const Text("Lihat Ulasan"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
