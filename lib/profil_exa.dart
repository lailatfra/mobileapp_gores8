import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfilePageExa extends StatefulWidget {
  const ProfilePageExa({super.key});
  @override
  State<ProfilePageExa> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageExa> {
  int selectedTab = 0; // 0 = Karya, 1 = Lencana

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header + Foto Profil
            Stack(
              clipBehavior: Clip.none, // Penting: biar bisa keluar dari Stack
              children: [
                Container(
                  height: 160,
                  color: const Color(0xFF1F3556),
                ),
                Positioned(
                  top: 16,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 100, // Posisi lebih rendah dari Container untuk timbul
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
                            AssetImage('assets/profil/exawinandya.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 75), // Supaya jarak dari avatar ke teks cukup

            const Text(
              'Exa Winandya',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'VIII A',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 25),
          

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF1F3556)),
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF1F3556),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Berteman',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF1F3556),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () {},
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
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF1F3556)),
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF1F3556),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              '1 Pengikut',
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
              padding: const EdgeInsets.symmetric(horizontal: 8), // jarak kiri-kanan 8
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
      'assets/images/duniawi.jpg',
      'assets/images/pedomanhidup.jpg',
      'assets/images/cermin_hias.jpg',
      'assets/images/banner_puisi.jpg',
      'assets/images/exawinandya.png',
      'assets/images/tari_menjeng.jpg',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }





  Widget buildLencanaContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.75,
        children: lencanaList.map((lencana) => buildLencanaCard(lencana)).toList(),
      ),
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
              Image.asset(lencana.imageAsset, height: 60),
              const SizedBox(height: 8),
              Text(
                lencana.title,
                style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
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
                    style: const TextStyle(fontSize: 11, color: Colors.blueGrey),
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
                onPressed: () {},
                child: const Text("Lihat Karya", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w300)),
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
    title: 'Buatlah Puisi Versimu!',
    tanggal: '20-30 Mei 2025',
    likes: 40,
  ),
  Lencana(
    imageAsset: 'assets/images/medal2.png',
    title: 'Menangkan Lomba Cerpen!',
    tanggal: '3-10 April 2025',
    likes: 22,
  ),
  Lencana(
    imageAsset: 'assets/images/medal1.png',
    title: 'Lukisan Kubisme',
    tanggal: '1-30 April 2025',
    likes: 67,
  ),
  // Tambah data lagi kalau perlu
];

