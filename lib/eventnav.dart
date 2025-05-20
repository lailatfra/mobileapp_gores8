import 'package:flutter/material.dart';

class EventBannerScroll extends StatelessWidget {
  const EventBannerScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> eventList = [
      {
        'date': '20-30 Mei 2025',
        'title': 'Buatlah Puisi Versimu!',
        'description': 'Sudah saatnya kamu unjuk bakat dan menunjukkan karya terbaikmu. Ini adalah tempat di mana kreativitasmu bisa bersinar.',
        'image': 'assets/images/banner_puisi.jpg',
      },
      {
        'date': '5-10 Juni 2025',
        'title': 'Festival Sains dan Teknologi',
        'description': 'Ikuti tantangan dan eksperimen ilmiah menarik, buat penemuan dan inovasi bersama teman-temanmu!',
        'image': 'assets/images/banner_sains.jpg',
      },
    ];
    

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: eventList.map((event) {
          return Container(
            width: 300,
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF1D3250)),
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
                            "20-30 Mei 2025", // Ini akan diubah di bawah
                            style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event['title']!,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event['description']!,
                        style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan navigasi jika perlu
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(29, 50, 80, 1),
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
                          ),
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
                    event['image']!,
                    width: 100,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}


class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}


class _EventPageState extends State<EventPage> {
  // List dropdown bulan dan tahun
  List<String> monthList = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
  ];
  List<String> yearList = ['2023', '2024', '2025'];

  // Nilai default yang terpilih
  String selectedMonth = 'Mei';
  String selectedYear = '2025';


  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> karyaList = [
      {
        'rank': 1,
        'title': 'Duniawi',
        'author': 'Exa Winandya',
        'class': 'VIII A',
        'votes': 400,
        'image': 'assets/images/duniawi.jpg',
      },
      {
        'rank': 2,
        'title': 'Cahaya Kehidupan',
        'author': 'Alieric Ernier',
        'class': 'IX F',
        'votes': 380,
        'image': 'assets/images/cahayakehidupan.png',
      },
      {
        'rank': 3,
        'title': 'Letupan Harapan',
        'author': 'Gavin Santana',
        'class': 'VIII C',
        'votes': 300,
        'image': 'assets/images/letupanharapan.png',
      },
      {
        'rank': 4,
        'title': 'Pendidikan dan Harapan',
        'author': 'Bhaskara Hadrian Athala',
        'class': 'VII C',
        'votes': 289,
        'image': 'assets/images/pendidikandanharapan.png',
      },
      {
        'rank': 5,
        'title': 'dasacfasfa',
        'author': 'vsdfscz',
        'class': 'VII I',
        'votes': 250,
        'image': 'assets/images/ketenanganjiwa.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115),
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
                  const SizedBox(height: 16), // ini setara dengan `top: 16`
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Event',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      // Dropdown Bulan dan Tahun
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              'Tampilkan',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 30),
            // Dropdown Bulan
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF1D3250)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedMonth, // ← pastikan kamu punya state ini
                  items: monthList.map((month) {
                    return DropdownMenuItem(
                      value: month,
                      child: Text(month),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Dropdown Tahun
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF1D3250)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedYear, // ← pastikan kamu punya state ini juga
                  items: yearList.map((year) {
                    return DropdownMenuItem(
                      value: year,
                      child: Text(year),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedYear = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 16),
            const EventBannerScroll(),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Tombol 🔥
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF1D3250), width: 1.5),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.local_fire_department, size: 20, color: Color(0xFF1D3250)),
                      onPressed: () {
                        // Aksi tombol fire
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Tombol ➕
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF1D3250), width: 1.5),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, size: 20, color: Color(0xFF1D3250)),
                      onPressed: () {
                        // Aksi tombol tambah
                      },
                    ),
                  ),
                ],
              ),
            ),


            const SizedBox(height: 12),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: karyaList.length,
              itemBuilder: (context, index) {
                final karya = karyaList[index];
                final isTopThree = karya['rank'] <= 3;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF1D3250)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      // Nomor / Icon Medali
                      isTopThree
                          ? Image.asset(
                              'assets/images/medal${karya['rank']}.png', // Misal: rank1.png, rank2.png, dll
                              width: 28,
                            )
                          : Text(
                              '${karya['rank']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                      const SizedBox(width: 10),

                      // Gambar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          karya['image'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Info Teks
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              karya['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              karya['author'],
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              karya['class'],
                              style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),

                      // Votes
                      Row(
                        children: [
                          Text(
                            '${karya['votes']} Votes',
                            style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.local_fire_department, size: 18, color: Colors.orange),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
