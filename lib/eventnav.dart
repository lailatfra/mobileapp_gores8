import 'package:flutter/material.dart';
import 'package:gores8_app/add.dart';

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

  String selectedItem = 'Buatlah Puisi Versimu!';

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
      appBar: AppBar(
        backgroundColor: Color(0xFF142C57),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0, // 🔧 Kunci untuk mendekatkan judul ke leading icon
        title: Text(
          'Event',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
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
                  const Spacer(),
                  // Dropdown Bulan
                  Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF1D3250)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedMonth,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: monthList.map((month) {
                          return DropdownMenuItem(
                            value: month,
                            child: Text(month, style: const TextStyle(fontSize: 13)),
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
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF1D3250)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedYear,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: yearList.map((year) {
                          return DropdownMenuItem(
                            value: year,
                            child: Text(year, style: const TextStyle(fontSize: 13)),
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
                  // Dropdown
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF1D3250), width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedItem,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF1D3250)),
                          style: const TextStyle(
                            color: Color(0xFF1D3250),
                            fontSize: 14,
                          ),
                          items: [
                            'Buatlah Puisi Versimu!',
                            'Festival Sains dan Teknologi',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedItem = newValue;
                              });
                            }
                          },
                        ),
                      ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddScreen()),
                        );
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nomor / Icon Medali
                      isTopThree
                          ? Image.asset(
                              'assets/images/medal${karya['rank']}.png',
                              width: 28,
                            )
                          : Text(
                              '${karya['rank']}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                      const SizedBox(width: 10),

                      // Gambar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          karya['image'],
                          width: 60,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              karya['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),

                            // Author
                            Text(
                              karya['author'],
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 2),

                            // Class & Votes in same row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Class (left)
                                Text(
                                  karya['class'],
                                  style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                                ),

                                // Votes + Icon (right)
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
                          ],
                        ),
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
