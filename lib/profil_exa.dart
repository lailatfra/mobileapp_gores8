import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Profil Exa',
//       home: const ProfilePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

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
      body: Column(
        children: [
          // Bagian atas dengan Stack untuk header & foto
          Stack(
            alignment: Alignment.topCenter,
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
                top: 120,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'assets/profil/exawinandya.png', // ganti sesuai kebutuhan
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 60), // untuk memberi ruang di bawah CircleAvatar

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
                  height: 40,
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
                        height: 40,
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
                        height: 40,
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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTabButton("2 Karya", 0),
              const SizedBox(width: 10),
              buildTabButton("1 Lencana", 1),
            ],
          ),
          const SizedBox(height: 15),

          // Expanded content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: selectedTab == 0 ? buildKaryaContent() : buildLencanaContent(),
            ),
          ),
        ],
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
                color: isSelected ? Color(0xFF1F3556) : Color.fromARGB(255, 46, 67, 99),
              ),
            ),
            const SizedBox(height: 4),
            if (isSelected)
              Container(height: 2, color: Color(0xFF1F3556), width: double.infinity),
            if (!isSelected)
              const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }

  Widget buildKaryaContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              'assets/images/duniawi.jpg',
              // height: 140,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Image.network(
              'assets/images/cermin_hias.jpg',
              // height: 140,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLencanaContent() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.emoji_events, size: 60, color: Color(0xFF1F3556)),
            const SizedBox(height: 8),
            const Text("Buatlah Puisi Versimu!",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today, size: 14),
                SizedBox(width: 4),
                Text("20-30 Mei 2025"),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.thumb_up_alt_outlined, size: 18),
                SizedBox(width: 4),
                Text("40"),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F3556),
              ),
              onPressed: () {},
              child: const Text("Lihat Karya"),
            ),
          ],
        ),
      ),
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
