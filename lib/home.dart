import 'package:flutter/material.dart';
import 'event.dart';
import 'notification.dart';
import 'profil_exa.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF1D3250)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: const [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  fontSize: 14, // Atur ukuran font di sini
                                ),
                              ),
                            ),
                            Icon(Icons.search, color: Color(0xFF1D3250)),
                          ],
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

                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/lenoraannie.png'),
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
                                Icon(Icons.calendar_month, size: 16, color: Colors.blueGrey),
                                SizedBox(width: 5),
                                Text(
                                  "20-30 Mei 2025",
                                  style: TextStyle(fontSize: 10, color: Colors.blueGrey),
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
                              "Sudah saatnya kamu unjuk bakat dan menunjukkan karya terbaikmu. Ini adalah tempat di mana kreativitasmu...",
                              style: TextStyle(fontSize: 11, color: Colors.blueGrey),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PuisiEventPage()), // Ganti dengan nama class halaman event kamu
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
                          height: 140,
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
                  children: const [
                    Text(
                      "ANGGOTA",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Lihat Semua",
                      style: TextStyle(
                        fontSize: 11,
                        color: Color.fromRGBO(29, 50, 80, 1),
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
                      // Profil user mengikuti
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/exawinandya.png'),
                            radius: 20,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Exa Winandya', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('VIII A', style: TextStyle(color: Colors.grey, fontSize: 11)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Gambar postingan
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/duniawi.jpg', // boleh ganti sama gambar puisi lain
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Judul puisi + button kecil
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Duniawi', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                          ElevatedButton(
                            onPressed: () {},
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
                                fontSize: 10,
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
                          color: Color.fromARGB(221, 148, 148, 148),
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(), // Garis pembatas

                      // Tanggal dan like
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('22-4-2025', style: TextStyle(color: Colors.grey, fontSize: 10)),
                          Row(
                            children: [
                              Text('40', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              SizedBox(width: 4),
                              Icon(Icons.thumb_up_alt_outlined, size: 16, color: Color(0xFF1D3250)),
                            ],
                          ),
                        ],
                      ),


                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Bagian Rekomendasi
                Text(
                  "REKOMENDASI",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // List Rekomendasi
                Column(
                  children: [
                    rekomendasiCard(
                      profileImage: 'assets/images/dinatalastie.png',
                      name: 'Dinata Lastie',
                      kelas: 'VII E',
                      postImage: 'assets/images/cermin_hias.jpg',
                      caption: 'Cermin Hias',
                      tanggal: '27-4-2025',
                      likeCount: 15,
                      isLiked: false,
                    ),
                    const SizedBox(height: 20),
                    rekomendasiCard(
                      profileImage: 'assets/images/sialatifarahmawati.png',
                      name: 'Sia Latifa Rahmawati',
                      kelas: 'VIII F',
                      postImage: 'assets/images/tari_menjeng.jpg',
                      caption: 'Tari Menjeng',
                      tanggal: '27-4-2025',
                      likeCount: 8,
                      isLiked: true,
                    ),
                  ],
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
              ),
            ),
            const SizedBox(height: 4),
            Text(
              kelas,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }


  static Widget rekomendasiCard({
    required String profileImage,
    required String name,
    required String kelas,
    required String postImage,
    required String caption,
    required String tanggal,
    required int likeCount,
    required bool isLiked,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1D3250)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profil user
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileImage),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(kelas, style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Gambar postingan
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              postImage,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),

          // Caption
          Text(
            caption,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),

          const SizedBox(height: 8),
          const Divider(), // Garis pembatas

          // Tanggal dan like
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tanggal,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              Row(
                children: [
                  Text(
                    likeCount.toString(),
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                    size: 16,
                    color: Color(0xFF1D3250),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


}

