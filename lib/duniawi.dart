import 'package:flutter/material.dart';

class PoemDetailPage extends StatelessWidget {
  const PoemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian atas (warna biru + gambar puisi)
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
                        width: 140, // Tetap pakai width tetap
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 85), // jarak setelah gambar

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.calendar_month, size: 16, color: Color(0xFF1D3250)),
                      SizedBox(width: 6),
                      Text(
                        '22 Mei 2025',
                        style: TextStyle(
                          fontSize: 10,
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D3250),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Biar lebih bulat
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: const Text(
                          'Buat Puisi Versimu!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.local_fire_department,
                        size: 20,
                        color: Color(0xFF1D3250),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 11, color: Colors.black),
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
                  fontSize: 11,
                  color: Color.fromARGB(255, 65, 65, 65),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            const Divider(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('40', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 4),
                  Icon(Icons.thumb_up_alt_outlined, size: 16, color: Color(0xFF1D3250)),
                ],
              ),
            ),

            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lihat Karya Lain',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Karya lain
            Column(
              children: [
                _OtherPoemCard(
                  title: 'Ketenangan Jiwa',
                  subtitle: 'Lukisan Pemandangan Alam',
                  date: '25 April 2025',
                  likeCount: 30,
                  isLiked: true,
                  imagePath: 'assets/images/pemandangan.jpg',
                  onTap: () {
                    // Aksi ketika diklik
                    print('Klik Ketenangan Jiwa');
                  },
                ),
                _OtherPoemCard(
                  title: 'Ilmu Pedoman Hidup',
                  subtitle: 'Di kala mentari merekah\nBergegas melangkahkan ....',
                  date: '20 April 2025',
                  likeCount: 22,
                  isLiked: false,
                  imagePath: 'assets/images/pedomanhidup.jpg',
                ),
                _OtherPoemCard(
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

  // static Widget _otherPoemCard(String title, String subtitle, String date, int likes, String imagePath) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.blueGrey.shade100),
  //       borderRadius: BorderRadius.circular(12),
  //       color: Colors.white,
  //     ),
  //     child: ListTile(
  //       contentPadding: const EdgeInsets.all(10),
  //       leading: ClipRRect(
  //         borderRadius: BorderRadius.circular(8),
  //         child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
  //       ),
  //       title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
  //       subtitle: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           if (subtitle.isNotEmpty)
  //             Padding(
  //               padding: const EdgeInsets.only(top: 2.0),
  //               child: Text(
  //                 subtitle,
  //                 maxLines: 1,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: const TextStyle(fontSize: 12),
  //               ),
  //             ),
  //           const SizedBox(height: 4),
  //           Row(
  //             children: [
  //               const Icon(Icons.calendar_month, size: 14, color: Colors.blueGrey),
  //               const SizedBox(width: 4),
  //               Text(date, style: const TextStyle(fontSize: 12)),
  //             ],
  //           )
  //         ],
  //       ),
  //       trailing: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Icon(Icons.thumb_up_alt_outlined, size: 16, color: Color(0xFF1D3250)),
  //           const SizedBox(height: 2),
  //           Text(likes.toString(), style: const TextStyle(fontSize: 12)),
  //         ],
  //       ),
  //       onTap: () {},
  //     ),
  //   );
  // }
}



class _OtherPoemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final int likeCount;
  final String imagePath;
  final bool isLiked;
  final VoidCallback? onTap;

  const _OtherPoemCard({
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF1D3250)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              // Gambar
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 64,
                  height: 74,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),

              // Judul, subjudul, tanggal
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    if (subtitle.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month,
                            size: 14, color: Colors.blueGrey),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // Ikon panah & like count
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.chevron_right, color: Colors.blueGrey),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$likeCount',
                        style: TextStyle(
                          fontSize: 12,
                          color: isLiked ? Colors.grey : Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                        size: 16,
                        color: const Color(0xFF1D3250),
                      ),
                    ],
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

