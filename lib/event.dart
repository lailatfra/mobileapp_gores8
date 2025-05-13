import 'package:flutter/material.dart';
import 'home.dart';
import 'duniawi.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PuisiEventPage(),
    );
  }
}

class PuisiEventPage extends StatelessWidget {
  const PuisiEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Gambar full width dan tidak gepeng
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/banner_puisi.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Overlay gelap agar teks terlihat menonjol
                  Container(
                    width: double.infinity,
                    height: 200, // samakan dengan tinggi gambar
                    color: Colors.black.withOpacity(0.4),
                  ),

                  // Tombol back
                  Positioned(
                    top: 16,
                    left: 8,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                    ),
                  ),

                  // Judul di bawah
                  const Positioned(
                    bottom: 16,
                    left: 16,
                    child: Text(
                      'Buatlah Puisi Versimu!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Sudah saatnya kamu unjuk bakat dan menunjukkan karya terbaikmu. Ini adalah tempat di mana kreativitasmu bisa bersinar.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Pilih mana karya yang paling kamu sukai. Kamu hanya bisa memilih 1 karya setiap harinya. Menangkan Event untuk mendapatkan lencana di profilmu',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 18,
                      color: Color(0xFF1D3250),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '20-30 Mei 2025',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D3250),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Ikuti Event ini',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(width: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const PoemDetailPage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: const PuisiCard(
                  rank: 1,
                  title: 'Duniawi',
                  name: 'Exa Winandya',
                  className: 'VIII A',
                  likeCount: 40,
                  isLiked: true,
                  voteCount: 400,
                  imageAsset: 'assets/images/duniawi.jpg',
                ),
              ),

              const PuisiCard(
                rank: 2,
                title: 'Cahaya Kehidupan',
                name: 'Alleric Ernier',
                className: 'IX F',
                likeCount: 35,
                isLiked: true,
                voteCount: 380,
                imageAsset: 'assets/images/banner_puisi.jpg',
              ),
              const PuisiCard(
                rank: 3,
                title: 'Letupan Harapan',
                name: 'Gavin Santana',
                className: 'VIII C',
                likeCount: 30,
                isLiked: true,
                voteCount: 300,
                imageAsset: 'assets/images/tari_menjeng.jpg',
              ),
              const PuisiCard(
                rank: 0,
                title: 'Pendidikan dan Harapan',
                name: 'Bhaskara Hadrian Athala',
                className: 'VII C',
                likeCount: 35,
                isLiked: false,
                voteCount: 380,
                imageAsset: 'assets/images/logo_smpn8.png',
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class PuisiCard extends StatelessWidget {
  final int rank;
  final String title, name, className, imageAsset;
  final int likeCount, voteCount;
  final bool isLiked;
  

  const PuisiCard({
    super.key,
    required this.rank,
    required this.title,
    required this.name,
    required this.className,
    required this.likeCount,
    required this.isLiked,
    required this.voteCount,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1D3250)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageAsset,
              width: 64,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(name, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w300)),
                Text(className, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w300)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                      size: 14,
                      color: Color(0xFF1D3250),
                    ),
                    const SizedBox(width: 4),
                    if (isLiked)
                      Text(
                        '$likeCount',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    const SizedBox(width: 12),
                    const Icon(Icons.local_fire_department, size: 14, color: Colors.blueGrey),
                    const SizedBox(width: 4),
                    Text(
                      '$voteCount Votes',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (rank > 0)
            Column(
              children: [
                Icon(Icons.emoji_events, color: const Color(0xFF1D3250)),
                Text('$rank', style: const TextStyle(fontSize: 10)),
              ],
            )
        ],
      ),
    );
  }
}
