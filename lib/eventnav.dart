import 'package:flutter/material.dart';
import 'package:gores8_app/event.dart';
// import 'package:gores8_app/add.dart';
import 'main_screen.dart';
import 'buat_event.dart';
import 'duniawi.dart';
import 'sains.dart';

class EventBannerScroll extends StatelessWidget {
  const EventBannerScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> eventList = [
      {
        'date': '20-30 Mei 2025',
        'title': 'Buatlah Puisi Versimu!',
        'description': 'Sudah saatnya kamu unjuk bakat dan menunjukkan karya terbaikmu. Ini adalah tempat di mana kreativitasmu bisa bersinar.',
        'image': 'assets/images/banner_puisi.jpg',
        'page': PuisiEventPage(),
      },
      {
        'date': '5-10 Juni 2025',
        'title': 'Festival Sains dan Teknologi',
        'description': 'Ikuti tantangan dan eksperimen ilmiah menarik, buat penemuan dan inovasi bersama teman-temanmu!',
        'image': 'assets/images/banner_sains.jpg',
        'page': SainsEventPage(),
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
                        children: [
                          const Icon(Icons.calendar_month, size: 15, color: Colors.blueGrey),
                          const SizedBox(width: 5),
                          Text(
                            event['date']!,
                            style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => event['page']),
                          );
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
  final void Function(int)? onTabChange;

  const EventPage({Key? key, this.onTabChange}) : super(key: key);

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

  // State untuk tracking vote dan data
  List<bool> isVotedList = [];
  List<Map<String, dynamic>> puisiList = [];
  List<Map<String, dynamic>> sainsList = [];

  @override
  void initState() {
    super.initState();
    // Initialize data dan vote state
    _initializeData();
    _initializeVoteState();
  }

  void _initializeData() {
    puisiList = [
      {
        'rank': 1,
        'title': 'Duniawi',
        'author': 'Exa Winandya',
        'class': 'VIII A',
        'votes': 400,
        'image': 'assets/images/duniawi.jpg',
        'page': const PoemDetailPage(),
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
      {
        'rank': 6,
        'title': 'Sajak Seonggok Jagung',
        'author': 'Nayla Ramadhani',
        'class': 'VII G',
        'votes': 245,
        'image': 'assets/images/seonggokjagung.jpg',
      },
    ];

    sainsList = [
      {
        'rank': 1,
        'title': 'Volcano Baking Soda',
        'author': 'Intan Permata',
        'class': 'IX B',
        'votes': 420,
        'image': 'assets/images/sains3.jpg',
      },
      {
        'rank': 2,
        'title': 'Balon Roket',
        'author': 'Dimas Pradana',
        'class': 'VIII D',
        'votes': 339,
        'image': 'assets/images/sains4.jpg',
      },
      {
        'rank': 3,
        'title': 'Filter Air Sederhana',
        'author': 'Farel Nugraha',
        'class': 'IX B',
        'votes': 230,
        'image': 'assets/images/filterair.jpg',
      },
      {
        'rank': 4,
        'title': 'Mobil Mini Tenaga Karet / Balon',
        'author': 'Zahira Putri',
        'class': 'IX D',
        'votes': 102,
        'image': 'assets/images/mobiltenagabalon.jpg',
      },
    ];
  }

  void _initializeVoteState() {
    final currentList = selectedItem == 'Buatlah Puisi Versimu!' ? puisiList : sainsList;
    setState(() {
      isVotedList = List.generate(currentList.length, (_) => false);
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
          // Arahkan ke halaman event jika perlu
        },
      ),
    );
  }

  void _showCancelVoteSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Anda batal memilih'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> karyaList =
        selectedItem == 'Buatlah Puisi Versimu!' ? puisiList : sainsList;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF142C57),
        elevation: 0,
        automaticallyImplyLeading: false, // ❌ Hilangkan tombol back
        title: const Padding(
          padding: EdgeInsets.only(left: 0), // ✅ Tambahkan padding kiri manual
          child: Text(
            'Event',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
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
                        border: Border.all(color: Color(0xFF1D3250), width: 1.0),
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
                                // Reset vote state ketika ganti event
                                _initializeVoteState();
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
                          MaterialPageRoute(builder: (context) => BuatEventScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            ListView.builder(
              itemCount: karyaList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final karya = karyaList[index];
                final isVoted = index < isVotedList.length ? isVotedList[index] : false;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: GestureDetector( // 👈 Bungkus dengan GestureDetector
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => karya['page'], // Pastikan 'page' sudah ditambahkan di list
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF1D3250)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Rank
                          Padding(
                            padding: const EdgeInsets.only(right: 12, top: 6),
                            child: Text(
                              '#${karya['rank']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFF1D3250),
                              ),
                            ),
                          ),

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

                          // Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  karya['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  karya['author'],
                                  style: TextStyle(color: Colors.black87, fontSize: 13),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      karya['class'],
                                      style: TextStyle(color: Colors.grey[700], fontSize: 13),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (!isVoted) {
                                            // Vote: ubah icon ke filled, tambah vote, tampilkan popup
                                            karya['votes'] += 1;
                                            isVotedList[index] = true;
                                            // Tampilkan popup setelah setState selesai
                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              _showVotePopup();
                                            });
                                          } else {
                                            // Batal vote: ubah icon ke outlined, kurangi vote, tampilkan snackbar
                                            karya['votes'] -= 1;
                                            isVotedList[index] = false;
                                            // Tampilkan snackbar setelah setState selesai
                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              _showCancelVoteSnackbar();
                                            });
                                          }
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            isVoted
                                                ? Icons.local_fire_department // Filled icon
                                                : Icons.local_fire_department_outlined, // Outlined icon
                                            size: 20,
                                            color: Colors.orange,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            karya['votes'].toString(),
                                            style: TextStyle(color: Colors.grey[800], fontSize: 13),
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
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildFirePopup({
    required BuildContext context,
    required VoidCallback onJoinEvent,
  }) {
    return Center(
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
          ),
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
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset('assets/images/fire.gif'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Anda berhasil memilih. Pilih kembali besok',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onJoinEvent,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1D3250),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Tutup', style: TextStyle(color: Colors.white)),
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
}