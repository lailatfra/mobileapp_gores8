import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores8_app/duniawi.dart';
import 'package:gores8_app/profile.dart';
import 'event.dart';
import 'notification.dart';
import 'profil_exa.dart';
import 'users.dart';
import 'package:logger/logger.dart';
import 'fullscreenvid.dart';
import 'search_page.dart';
import 'zoomduniawi.dart';
import 'profil_exa.dart';
// import 'package:fl_chart/fl_chart.dart';

TextEditingController searchController = TextEditingController();
final Logger _logger = Logger();

class HomeScreen extends StatefulWidget {
  final Function(int)? onTabChange; // ← tambahkan ini

  const HomeScreen({Key? key, this.onTabChange}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  String selectedYear = '2025';
  int likeCount = 12;
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                // Baris Logo Gores8 dan SMPN 8
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/logo_splash.jpeg',
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/logo_smpn8.png',
                      height: 50,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Baris Search, Notification, Profile
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const SearchPage(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, 1),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF1D3250)),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: const [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Search',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Icon(Icons.search, color: Color(0xFF1D3250)),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Tombol Notifikasi dengan Navigasi
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NotificationPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF1D3250)),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.notifications_none, color: Color(0xFF1D3250)),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Material(
                      color: Colors.transparent, // agar transparan
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          _logger.i("Avatar ditekan!");
                          widget.onTabChange?.call(4);
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/lenoraannie.png'),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20), // Jarak lebih besar setelah search

                // Banner Event dengan gambar kanan
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFF1D3250)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      // Kiri - Teks
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.calendar_month, size: 15, color: Colors.blueGrey),
                                SizedBox(width: 5),
                                Text(
                                  "20-30 Mei 2025",
                                  style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Buatlah Puisi Versimu!",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Sudah saatnya kamu unjuk bakat dan menunjukkan karya terbaikmu. Ini adalah tempat...",
                              style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => PuisiEventPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(29, 50, 80, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Lihat selengkapnya',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 12,
                                )
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      // Kanan - Gambar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/banner_puisi.jpg', // <- ini ganti dengan file yang tadi kamu upload
                          width: 100,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Bagian Anggota
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ANGGOTA",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UsersScreen()),
                        );
                      },
                      child: Text(
                        "Lihat Semua",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(29, 50, 80, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      anggotaCard(
                        'assets/images/exawinandya.png',
                        'Exa Winandya',
                        'VIII A',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfilePageExa()),
                          );
                        },
                      ),
                      anggotaCard('assets/images/dinatalastie.png', 'Dinata Lastie', 'VII E'),
                      anggotaCard('assets/images/sialatifarahmawati.png', 'Sia Latifa Rahmawati', 'IX B'),
                      anggotaCard('assets/images/gavinsantana.png', 'Gavin Santana', 'VIII C'),
                      anggotaCard('assets/images/cassiusreno.png', 'Cassius Reno', 'VII D'),
                    ],
                  ),
                ),




                const SizedBox(height: 25),

                // Bagian Mengikuti
                Text(
                  "MENGIKUTI",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF1D3250)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfilePageExa()),
                          );
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/exawinandya.png'),
                              radius: 20,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Exa Winandya', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                Text('VIII A', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ),


                      const SizedBox(height: 10),

                      // Gambar postingan
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ZoomDuniawiPage(imagePath: 'assets/images/banner_puisi.jpg'),
                            ),
                          );

                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/banner_puisi.jpg',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Judul puisi + button kecil
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => const PoemDetailPage()),
                              );
                            },
                            child: const Text(
                              'Duniawi', 
                              style: TextStyle(
                                fontSize: 15, 
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PuisiEventPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              backgroundColor: Color(0xFF1D3250),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Buatlah Puisi Versimu!',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Isi puisi
                      const Text(
                        'Tangga itu menuntun manusia untuk mencapai tujuan.\n'
                        'Semua manusia berhak untuk menggunakan...',
                        style: TextStyle(
                          color: Color.fromARGB(221, 124, 124, 124),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(), // Garis pembatas


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Tanggal dan ikon
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.calendar_month, size: 15, color: Colors.blueGrey),
                                SizedBox(width: 4),
                                Text(
                                  "20-30 Mei 2025",
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ),

                          // Like button di kanan
                          LikeButton(initialCount: 40),
                        ],
                      ),




                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Bagian Rekomendasi
                const Text(
                  'REKOMENDASI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),

                _buildImageCard(
                  context,
                  profileImage: 'assets/profil/dinatalastie.png',
                  name: 'Dinata Lastie',
                  kelas: 'VIII E',
                  image: 'assets/images/cermin_hias.jpg',
                  title: 'Cermin Hias',
                  date: '27 April 2025',
                  likes: 15,
                  isLiked: isLiked,
                  onLikeToggle: _toggleLike,
                ),
                _buildVideoCard(
                  context,
                  profileImage: 'assets/profil/sialatifarahmawati.png',
                  name: 'Sia Latifa Ratmawati',
                  kelas: 'VIII F',
                  image: 'assets/images/tari_menjeng.jpg',
                  title: 'Tari Menjeng',
                  anggota: ['Sia/22', 'Lidya/18', 'Diva/10', 'Binara/2', 'Oliv/21'],
                  date: '30 April 2025',
                  likes: 33,
                  isLiked: isLiked,
                  onLikeToggle: _toggleLike,
                ),
                const SizedBox(height: 16),
                _buildImageCard(
                  context,
                  profileImage: 'assets/profil/cassiusreno.png',
                  name: 'Cassius Reno',
                  kelas: 'VIII F',
                  image: 'assets/images/hujandiujungdesember.jpg',
                  title: 'Hujan di Ujung Desember',
                  description:
                      'Cerpen ini bercerita tentang seorang perempuan bernama Laira yang kembali ke kampung halamannya setelah tujuh tahun merantau di kota. Di tengah hujan yang tak kunjung reda di ujung Desember, ia bertemu kembali dengan masa lalu yang belum selesai: rumah kayu tua, secangkir teh jahe, dan seorang lelaki yang pernah ia tinggalkan tanpa pamit...',
                  date: '30 April 2025',
                  likes: 40,
                  isLiked: isLiked,
                  onLikeToggle: _toggleLike,
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }


  static Widget anggotaCard(String imagePath, String name, String kelas, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF1D3250)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 40,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              kelas,
              style: const TextStyle(color: Colors.grey, fontSize: 12,),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(
    BuildContext context, {
    required String profileImage,
    required String name,
    required String kelas,
    required String image,
    required String title,
    String? tag,
    String? description,
    required String date,
    required int likes,
    bool? isLiked,
    VoidCallback? onLikeToggle,
    bool showButton = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF1D3250)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfo(name, kelas, profileImage),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: image.startsWith("http")
                  ? Image.network(image)
                  : Image.asset(image),
            ),
            const SizedBox(height: 18),
            if (showButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PuisiEventPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    backgroundColor: const Color(0xFF1D3250),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Cerpen Akhir Tahun',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
            else
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),

            const SizedBox(height: 8),
            if (tag != null)
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(tag, style: const TextStyle(fontSize: 12)),
              ),
            if (description != null) ...[
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 12, color: Color.fromARGB(221, 124, 124, 124)),
              ),
            ],
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            _buildFooter(
              date: date,
              likes: likes,
              isLiked: isLiked,
              onLikeToggle: onLikeToggle,
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildVideoCard(
    BuildContext context, {
    required String profileImage,
    required String name,
    required String kelas,
    required String image,
    required String title,
    required List<String> anggota,
    required String date,
    required int likes,
    bool? isLiked,
    VoidCallback? onLikeToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF1D3250)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfo(name, kelas, profileImage),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FullscreenVideoPlayer(videoPath: 'assets/videos/tarimenjeng.mp4'),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(image), // tetap bisa pakai gambar thumbnail dulu
                  ),
                ),
                const Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
              ],
            ),

            const SizedBox(height: 18),
            Text(title, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
            const SizedBox(height: 8),
            ...anggota.map((e) => Text(
                  '• $e',
                  style: const TextStyle(fontSize: 12, color: Color.fromARGB(221, 124, 124, 124)),
                )),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            _buildFooter(
              date: date,
              likes: likes,
              isLiked: isLiked,
              onLikeToggle: onLikeToggle,
            ),
          ],
        ),
      ),
    );
  }


   Widget _buildUserInfo(String name, String kelas, String profileImage) {
    return Row(
      children: [
        const SizedBox(height: 8),
        CircleAvatar(
          backgroundImage: profileImage.startsWith('http')
          ? NetworkImage(profileImage)
          : AssetImage(profileImage) as ImageProvider,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(kelas, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget _buildFooter({
    required String date,
    required int likes,
    bool? isLiked,
    VoidCallback? onLikeToggle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.calendar_month, size: 16),
            const SizedBox(width: 8),
            Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        if (onLikeToggle != null && isLiked != null)
          InkWell(
            onTap: onLikeToggle,
            child: Row(
              children: [
                Text('$likes', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 8),
                Icon(
                  isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                  size: 16,
                  color: isLiked ? Color(0xFF1D3250) : null,
                ),
              ],
              
            ),
          )
        else
          Row(
            children: [
              Text('$likes', style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 8),
              const Icon(Icons.thumb_up_alt_outlined, size: 16),
            ],
          ),
      ],
    );
  }


}


class LikeButton extends StatefulWidget {
  final int initialCount;

  const LikeButton({super.key, this.initialCount = 0});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late int likeCount;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likeCount = widget.initialCount;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$likeCount',
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: toggleLike,
          child: Icon(
            isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
            size: 16,
            color: const Color(0xFF1D3250),
          ),
        ),
      ],
    );
  }
}
