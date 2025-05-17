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
                  // Gunakan AspectRatio agar gambar tidak gepeng dan responsif
                  AspectRatio(
                    aspectRatio: 16 / 9, // Sesuaikan rasio aspek gambar
                    child: Image.asset(
                      'assets/images/banner_puisi.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),

                  // Overlay mengikuti ukuran gambar dengan Positioned.fill
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
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
                        fontSize: 22,
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
                    fontSize: 12,
                    color: Color.fromARGB(255, 133, 133, 133),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Pilih mana karya yang paling kamu sukai. Kamu hanya bisa memilih 1 karya setiap harinya. Menangkan Event untuk mendapatkan lencana di profilmu',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 133, 133, 133),
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
                      size: 15,
                      color: Color(0xFF1D3250),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '20-30 Mei 2025',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
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
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white),
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
                  initialLikeCount: 40,
                  initiallyLiked: true,
                  voteCount: 400,
                  imageAsset: 'assets/images/duniawi.jpg',
                ),
              ),

              const PuisiCard(
                rank: 2,
                title: 'Cahaya Kehidupan',
                name: 'Alleric Ernier',
                className: 'IX F',
                initialLikeCount: 35,
                initiallyLiked: true,
                voteCount: 380,
                imageAsset: 'assets/images/banner_puisi.jpg',
              ),
              const PuisiCard(
                rank: 3,
                title: 'Letupan Harapan',
                name: 'Gavin Santana',
                className: 'VIII C',
                initialLikeCount: 30,
                initiallyLiked: true,
                voteCount: 300,
                imageAsset: 'assets/images/tari_menjeng.jpg',
              ),
              const PuisiCard(
                rank: 0,
                title: 'Pendidikan dan Harapan',
                name: 'Bhaskara Hadrian Athala',
                className: 'VII C',
                initialLikeCount: 27,
                initiallyLiked: false,
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

class PuisiCard extends StatefulWidget {
  final int rank;
  final String title, name, className, imageAsset;
  final int voteCount;
  final int initialLikeCount;
  final bool initiallyLiked;

  const PuisiCard({
    super.key,
    required this.rank,
    required this.title,
    required this.name,
    required this.className,
    required this.initialLikeCount,
    required this.initiallyLiked,
    required this.voteCount,
    required this.imageAsset,
  });

  @override
  State<PuisiCard> createState() => _PuisiCardState();
}

class _PuisiCardState extends State<PuisiCard> {
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.initiallyLiked;
    likeCount = widget.initialLikeCount;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked;
    });

    // API call
    // await ApiService.likePuisi(widget.title, isLiked);
  }


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
              widget.imageAsset,
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
                Text(widget.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(widget.name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                Text(widget.className, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: toggleLike,
                      child: Row(
                        children: [
                          Text(
                            '$likeCount',
                            style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                            size: 16,
                            color: const Color(0xFF1D3250),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.local_fire_department, size: 16, color: const Color(0xFF1D3250)),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.voteCount} Votes',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.rank > 0)
            Column(
              children: [
                Icon(Icons.emoji_events, color: const Color(0xFF1D3250)),
                Text('${widget.rank}', style: const TextStyle(fontSize: 13)),
              ],
            )
        ],
      ),
    );
  }
}

