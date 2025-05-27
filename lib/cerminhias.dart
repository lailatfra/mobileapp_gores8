import 'package:flutter/material.dart';
import 'event.dart';
import 'ulasan_widget.dart';
import 'lukisanpemandangan.dart';

class PoemDetailPage extends StatefulWidget {
  final void Function(int)? onTabChange;

  const PoemDetailPage({super.key, this.onTabChange});


  @override
  State<PoemDetailPage> createState() => _PoemDetailPageState();
}

class _PoemDetailPageState extends State<PoemDetailPage> {
  bool isMainLiked = false;
  int mainLikeCount = 40;
  bool isVoted = false;

  void toggleMainLike() {
    setState(() {
      isMainLiked = !isMainLiked;
      mainLikeCount += isMainLiked ? 1 : -1;
    });
  }

  void _showVotePopup() {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (context) => _buildFirePopup(
        context: context,
        onJoinEvent: () {
          Navigator.pop(context);
          // Navigasi ke halaman Event kamu, misalnya:
          // Navigator.pushNamed(context, '/event');
        },
      ),
    );
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
      'nama': 'Dian Lestari',
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
                        'assets/images/duniawi.jpg',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
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
                        '22 Mei 2025',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 92, 92, 92),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PuisiEventPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D3250),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        ),
                        child: const Text(
                          'Buatlah Puisi Versimu!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          if (!isVoted) {
                            setState(() {
                              isVoted = true;
                            });
                            _showVotePopup(); // tampilkan popup setelah vote
                          } else {
                            setState(() {
                              isVoted = false;
                            });
                            _showCancelMessage(); // misalnya snackbar bahwa vote dibatalkan
                          }
                        },
                        child: Icon(
                          isVoted
                              ? Icons.local_fire_department
                              : Icons.local_fire_department_outlined,
                          size: 24,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Duniawi',
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
                      TextSpan(text: 'Exa Winandya VIII A', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  'Pendidikan adalah tangga harapan\n'
                  'Tangga itu menuntun manusia untuk mencapai tujuan\n'
                  'Semua manusia berhak untuk menggunakan\n'
                  'Untuk mengubah mimpi menjadi kenyataan\n\n'
                  'Tangga itu tidak boleh disembunyikan\n'
                  'Dari semua insan yang ingin perubahan\n'
                  'Tangga tersebut tidak boleh disalahgunakan\n'
                  'Hanya untuk meraih keuntungan\n\n'
                  'Tangga itu harus benar-benar kuat\n'
                  'Agar mampu merubah manusia menjadi bermartabat\n'
                  'Tangga tersebut harus selalu dirawat\n'
                  'Agar bisa membimbing kita meraih akal sehat\n\n'
                  'Tangga itu harus bisa beradaptasi\n'
                  'Dari zaman yang begitu kencang berlari\n'
                  'Tangga itu tidak boleh dinodai\n'
                  'Agar bisa mengantar kita menjadi manusia bermoral yang hakiki\n',
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Tombol Lihat Ulasan
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

                                    // Tambahkan input komentar
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
                                          backgroundColor: Color(0xFF1D3250),
                                          child: IconButton(
                                            icon: const Icon(Icons.send, color: Colors.white),
                                            onPressed: () {
                                              String komentar = komentarController.text;
                                              if (komentar.isNotEmpty) {
                                                // TODO: Tambahkan logika untuk mengirim ulasan ke server atau state
                                                print('Komentar dikirim: $komentar');
                                                komentarController.clear(); // Reset input
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
                      backgroundColor: const Color.fromRGBO(29, 50, 80, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    child: const Text(
                      'Lihat Ulasan',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),



                  // Spacer untuk memisahkan tombol dan icon
                  Row(
                    children: [
                      Text('$mainLikeCount', style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: toggleMainLike,
                        child: Icon(
                          isMainLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                          size: 16,
                          color: const Color(0xFF1D3250),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            const SizedBox(height: 24),
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
              children: [
                OtherPoemCard(
                  title: 'Ketenangan Jiwa',
                  subtitle: 'Lukisan Pemandangan Alam',
                  date: '25 April 2025',
                  likeCount: 30,
                  isLiked: true,
                  imagePath: 'assets/images/ketenanganjiwa.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KetenanganJiwa(),
                      ),
                    );
                  },
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
                  title: 'Cermin Hias',
                  subtitle: ' ', 
                  date: '20 April 2025',
                  likeCount: 22,
                  isLiked: false,
                  imagePath: 'assets/images/cermin_hias.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KetenanganJiwa(),
                      ),
                    );
                  },
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
  final VoidCallback? onTap;

  const OtherPoemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.likeCount,
    required this.imagePath,
    required this.isLiked,
    this.onTap,
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
        onTap: widget.onTap,
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
                          child: GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromARGB(255, 90, 90, 90),
                              ),
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


Widget _buildFirePopup({
  required BuildContext context,
  required VoidCallback onJoinEvent,
}) {
  return Center(
    child: Stack(
      children: [
        // Black semi-transparent overlay
        Positioned.fill(
          child: GestureDetector(
            onTap: () => Navigator.pop(context), // tutup saat klik luar
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        // Popup content
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xFFF4FAFC),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Gambar GIF Api
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    'assets/images/fire.gif', // Pastikan kamu pakai gif
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),

                // Pesan
                const Text(
                  'Anda berhasil memilih. Pilih kembali besok',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),

                // Tombol Ikuti Event
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onJoinEvent,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D3250),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Tutup',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

