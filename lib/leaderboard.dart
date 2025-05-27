import 'package:flutter/material.dart';

class LihatSemuaLeaderboardPage extends StatefulWidget {
  @override
  _LihatSemuaLeaderboardPageState createState() => _LihatSemuaLeaderboardPageState();
}

class _LihatSemuaLeaderboardPageState extends State<LihatSemuaLeaderboardPage> {
  int currentPage = 1;
  final int itemsPerPage = 10;

  late final List<Map<String, dynamic>> leaderboardData;

  @override
  void initState() {
    super.initState();
    leaderboardData = List.generate(20, (index) {
      final avatars = [
        'assets/profil/exawinandya.png',
        'assets/profil/dinatalastie.png',
        'assets/profil/sialatifarahmawati.png',
        'assets/profil/gavinsantana.png',
        'assets/profil/cassiusreno.png',
        'assets/profil/bhaskarahadrianathala.png',
        'assets/profil/lenoraannie.png',
        'assets/profil/agathaluisaarsyla.png',
        'assets/profil/gavinsantana.png',
        'assets/profil/lidyaesandry.png',
        'assets/profil/exawinandya.png',
        'assets/profil/dinatalastie.png',
        'assets/profil/sialatifarahmawati.png',
        'assets/profil/gavinsantana.png',
        'assets/profil/cassiusreno.png',
        'assets/profil/bhaskarahadrianathala.png',
        'assets/profil/lenoraannie.png',
        'assets/profil/agathaluisaarsyla.png',
        'assets/profil/gavinsantana.png',
        'assets/profil/lidyaesandry.png',
      ];
      final names = [
        'Exa Winandya',
        'Dinata Lastie',
        'Sia Latifa Rahmawati',
        'Gavin Santana',
        'Cassius Reno',
        'Bhaskara Hadrian Athala',
        'Rahma Nadia',
        'Agatha Luisa Arsylia',
        'Gavin Santana',
        'Lidya Esandry',
        'Zahira Putri',
        'Keysha Anindya',
        'Dimas Wibowo',
        'Salma Fauziah',
        'Rehan Mahendra',
        'Tiara Meisya',
        'Aulia Rahma',
        'Ilham Satria',
        'Salsabila Dewi',
        'Arga Prasetyo'
      ];
      final percentages = [
        49.8,
        40.0,
        29.1,
        26.8,
        26.7,
        23.8,
        23.4,
        23.0,
        20.8,
        19.9
      ];
      return {
        'rank': index + 1,
        'avatar': avatars[index % avatars.length],
        'name': names[index % names.length],
        'percentage': percentages[index % percentages.length],
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final int totalPages = (leaderboardData.length / itemsPerPage).ceil();
    final start = (currentPage - 1) * itemsPerPage;
    final end = (start + itemsPerPage).clamp(0, leaderboardData.length);
    final currentData = leaderboardData.sublist(start, end);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF142C57),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Text(
          'Leaderboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            for (var item in currentData)
              _buildLeaderboardItem(
                item['rank'],
                item['avatar'],
                item['name'],
                item['percentage'],
              ),
            SizedBox(height: 100), // ruang ekstra untuk bottom nav
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: currentPage > 1
                  ? () => setState(() => currentPage--)
                  : null,
            ),
            if (currentPage > 2)
              paginationButton('1', selected: currentPage == 1, onTap: () => setState(() => currentPage = 1)),
            if (currentPage > 3)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text('...'),
              ),
            for (int i = currentPage - 1; i <= currentPage + 1; i++)
              if (i > 1 && i < totalPages)
                paginationButton('$i', selected: currentPage == i, onTap: () => setState(() => currentPage = i)),
            if (currentPage < totalPages - 2)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text('...'),
              ),
            if (currentPage < totalPages)
              paginationButton('$totalPages', selected: currentPage == totalPages, onTap: () => setState(() => currentPage = totalPages)),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: currentPage < totalPages
                  ? () => setState(() => currentPage++)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardItem(
      int rank, String avatarPath, String name, double percentage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 25,
            alignment: Alignment.center,
            child: Text(
              rank.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: const Color.fromARGB(255, 92, 92, 92),
              ),
            ),
          ),
          SizedBox(width: 16),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(avatarPath),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color.fromARGB(255, 90, 90, 90),
                  ),
                ),
                SizedBox(height: 8),
                Stack(
                  children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: percentage / 100,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: Color(0xFF142C57),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          SizedBox(
            width: 50,
            child: Text(
              '${percentage.toStringAsFixed(1)}%',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF4CAF50),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget paginationButton(String text, {bool selected = false, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          minimumSize: const Size(36, 36),
          backgroundColor: selected ? const Color(0xFF142C57) : Colors.white,
          side: const BorderSide(color: Color(0xFF142C57)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          text,
          style: TextStyle(color: selected ? Colors.white : const Color(0xFF142C57)),
        ),
      ),
    );
  }
}
