import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'lenorapengikut.dart';
import 'lukisanpemandangan.dart';
import 'editprofile.dart';
import 'settings.dart';

class ProfileScreen extends StatefulWidget {
  final bool showSuccessMessage;
  final Function(int)? onTabChange;

  const ProfileScreen({
    Key? key, 
    this.showSuccessMessage = false,
    this.onTabChange
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileScreen> {
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    
    // Show success message if needed
    if (widget.showSuccessMessage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSuccessMessage();
      });
    }
  }

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
                  color: const Color(0xFF1F3556),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 100, 
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 56,
                        backgroundImage:
                            AssetImage('assets/profil/lenoraannie.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 75), 

            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Lenora Annie',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFF4CAF50),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Guru',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Guru Seni',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'https://www.instagram.com/lenoannieee_/',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 143, 224),
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // Row untuk Edit Profil dan tombol setting
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditProfilPage(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF1F3556)),
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF1F3556),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Edit Profil',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF1F3556),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsScreen(onTabChange: widget.onTabChange),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF1F3556)),
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF1F3556),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Icon(
                            Icons.settings,
                            size: 18,
                            color: Color(0xFF1F3556),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Tombol Mengikuti & Pengikut
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MengikutiPengikutLenoraPage(selectedTab: 0),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF1F3556)),
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF1F3556),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              '2 Mengikuti',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF1F3556),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MengikutiPengikutLenoraPage(selectedTab: 1),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF1F3556)),
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF1F3556),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              '5 Pengikut',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF1F3556),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTabButton("2 Karya", 0),
                  const SizedBox(width: 0),
                  buildTabButton("1 Lencana", 1),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Expanded content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: selectedTab == 0 ? buildKaryaContent() : buildLencanaContent(),
            ),

            const SizedBox(height: 100),

          ],
        ),
      ),
    );
  }

void _showSuccessMessage() {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.white, size: 20),
          SizedBox(width: 8),
          Text(
            'Status telah berhasil diperbarui',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(16),
    ),
  );
}

  Widget buildTabButton(String text, int index) {
    bool isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                color: isSelected ? const Color(0xFF1F3556) : const Color.fromARGB(255, 46, 67, 99),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 2,
                color: isSelected ? const Color(0xFF1F3556) : Colors.transparent,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKaryaContent() {
    List<String> imagePaths = [
      'assets/images/ketenanganjiwa.jpg',
      'assets/images/pedomanhidup.jpg',
      'assets/images/cermin_hias.jpg',
      'assets/images/hujandiujungdesember.jpg',
      'assets/images/letupanharapan.png',
      'assets/images/pemandangan.jpg',
      'assets/images/cahayakehidupan.png',
    ];

    List<Widget> pages = [
      KetenanganJiwa(),
      // PedomanHidupPage(),
      // CerminHiasPage(),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth < 600 ? 2 : 3;

        return MasonryGridView.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildLencanaContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth < 600 ? 2 : 3;

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.75,
          children: lencanaList.map((lencana) => buildLencanaCard(lencana)).toList(),
        );
      },
    );
  }

  Widget buildLencanaCard(Lencana lencana) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF1F3556)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 3),
              Image.asset(lencana.imageAsset, height: 55),
              const SizedBox(height: 8),
              Text(
                lencana.title,
                style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_month, size: 14, color: Colors.blueGrey),
                  const SizedBox(width: 5),
                  Text(
                    lencana.tanggal,
                    style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              /// Bagian LIKE
              GestureDetector(
                onTap: () {
                  setState(() {
                    lencana.isLiked = !lencana.isLiked;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${lencana.likes + (lencana.isLiked ? 1 : 0)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: lencana.isLiked ? Colors.grey : Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      lencana.isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                      size: 16,
                      color: const Color(0xFF1D3250),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F3556),
                  minimumSize: const Size.fromHeight(36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KetenanganJiwa()),
                  );
                },
                child: const Text("Lihat Karya", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildStatButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}

class Lencana {
  final String imageAsset;
  final String title;
  final String tanggal;
  final int likes;
  bool isLiked;

  Lencana({
    required this.imageAsset,
    required this.title,
    required this.tanggal,
    required this.likes,
    this.isLiked = false,
  });
}

final List<Lencana> lencanaList = [
  Lencana(
    imageAsset: 'assets/images/medal1.png',
    title: 'Lukisan Pemandangan',
    tanggal: '20-30 Mei 2025',
    likes: 40,
  ),
  Lencana(
    imageAsset: 'assets/images/medal2.png',
    title: 'Puisi Kemenangan',
    tanggal: '3-10 April 2025',
    likes: 22,
  ),
  Lencana(
    imageAsset: 'assets/images/medal1.png',
    title: 'Kerajinan Bahan Campuran',
    tanggal: '1-30 April 2025',
    likes: 67,
  ),
];