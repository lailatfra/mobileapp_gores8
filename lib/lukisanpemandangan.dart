import 'package:flutter/material.dart';
import 'package:gores8_app/edit_ketenanganjiwa.dart';
import 'ulasan_widget.dart';

class KetenanganJiwa extends StatefulWidget {
  const KetenanganJiwa({super.key});
  

  @override
  State<KetenanganJiwa> createState() => _KetenanganJiwaState();
}

class _KetenanganJiwaState extends State<KetenanganJiwa> {
  bool isMainLiked = false;
  int mainLikeCount = 104;

  void toggleMainLike() {
    setState(() {
      isMainLiked = !isMainLiked;
      mainLikeCount += isMainLiked ? 1 : -1;
    });
  }

  TextEditingController komentarController = TextEditingController();

  void _showCancelMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Anda batal memilih. Anda bisa memilih karya ini kembali dengan klik tombol vote atau memilih karya lain.',
        ),
        duration: Duration(seconds: 3),
      ),
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 160,
                  color: const Color(0xFF1D3250),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/ketenanganjiwa.jpg',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 85),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.calendar_month, size: 15, color: Color(0xFF1D3250)),
                      SizedBox(width: 6),
                      Text(
                        '25 April 2025',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 92, 92, 92),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ketenangan Jiwa',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 13, color: Colors.black),
                    children: [
                      TextSpan(text: 'Karya ', style: TextStyle(fontWeight: FontWeight.w300)),
                      TextSpan(text: 'Lenora Annie Guru Seni', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lukisan Pemandangan Alam\n',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 13,
                    color: Color.fromARGB(255, 65, 65, 65),
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),

            const Divider(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Kiri: Edit, Hapus, dan Lihat Ulasan
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, size: 20),
                        color: const Color(0xFF1D3250),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditKetenanganJiwa()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                        onPressed: () {
                          // aksi hapus
                        },
                      ),
                      
                      const SizedBox(width: 18),

                      ElevatedButton(
                        onPressed: () {
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
                                              ulasanTile(
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
                                        // Input komentar
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
                                                    // TODO: Tambahkan logika untuk menyimpan ulasan ke database / list
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
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D3250),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        child: const Text(
                          'Lihat Ulasan',
                          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),

                  // Kanan: Like
                  GestureDetector(
                    onTap: toggleMainLike,
                    child: Row(
                      children: [
                        Text('$mainLikeCount', style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 4),
                        Icon(
                          isMainLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                          size: 16,
                          color: const Color(0xFF1D3250),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),



            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lihat Karya Lain',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Column(
              children: const [
                OtherPoemCard(
                  title: 'Duniawi',
                  subtitle: 'Pendidikan adalah tangga harapan',
                  date: '22 Mei 2025',
                  likeCount: 40,
                  isLiked: true,
                  imagePath: 'assets/images/duniawi.jpg',
                ),
                OtherPoemCard(
                  title: 'Ilmu Pedoman Hidup',
                  subtitle: 'Di kala mentari merekah\nBergegas melangkahkan ....',
                  date: '20 April 2025',
                  likeCount: 22,
                  isLiked: false,
                  imagePath: 'assets/images/pedomanhidup.jpg',
                ),
                OtherPoemCard(
                  title: 'Cermin Kehidupan',
                  subtitle: '',
                  date: '20 April 2025',
                  likeCount: 22,
                  isLiked: false,
                  imagePath: 'assets/images/cermin_hias.jpg',
                ),
              ],
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class OtherPoemCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String date;
  final int likeCount;
  final String imagePath;
  final bool isLiked;

  const OtherPoemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.likeCount,
    required this.imagePath,
    required this.isLiked,
  });

  @override
  State<OtherPoemCard> createState() => _OtherPoemCardState();
}

class _OtherPoemCardState extends State<OtherPoemCard> {
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    likeCount = widget.likeCount;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF1D3250)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.imagePath,
                  width: 64,
                  height: 74,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.blueGrey),
                      ],
                    ),
                    if (widget.subtitle.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          widget.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, size: 14, color: Colors.blueGrey),
                        const SizedBox(width: 4),
                        Text(
                          widget.date,
                          style: const TextStyle(fontSize: 12),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: toggleLike,
                          child: Row(
                            children: [
                              Text(
                                '$likeCount',
                                style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 43, 43, 43)),
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}