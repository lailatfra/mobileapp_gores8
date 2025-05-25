import 'package:flutter/material.dart';

class LihatSemuaLeaderboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> leaderboardData = List.generate(20, (index) {
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
    ];
    final names = [
      'Exa Winandya',
      'Dinata Lastie',
      'Sia Latifa Rahmawati',
      'Gavin Santana',
      'Cassius Reno',
      'Bhaskara Hadrian Athala',
      'Lenora Annie',
      'Agatha Luisa Arsylia',
      'Gavin Santana',
      'Lidya Esandry'
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color(0xFF142C57),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0, // 🔧 Kunci untuk mendekatkan judul ke leading icon
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
            for (var item in leaderboardData)
              _buildLeaderboardItem(
                item['rank'],
                item['avatar'],
                item['name'],
                item['percentage'],
              ),
            SizedBox(height: 24),
            _buildPagination(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardItem(
      int rank, String avatarPath, String name, double percentage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 25,
            child: Text(
              rank.toString(),
              style: TextStyle(fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 92, 92, 92)),
            ),
          ),
          SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(avatarPath),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: const Color.fromARGB(255, 90, 90, 90),
                  ),
                ),
                SizedBox(height: 6),
                Stack(
                  children: [
                    Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: percentage / 100,
                      child: Container(
                        height: 6,
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
              '${percentage.toString().replaceAll('.0', '')}%',
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

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _pageButton('1', isActive: true),
        _pageButton('2'),
        Text('...', style: TextStyle(color: Colors.white)),
        _pageButton('67'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
        )
      ],
    );
  }

  Widget _pageButton(String text, {bool isActive = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Color(0xFF142C57) : Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
