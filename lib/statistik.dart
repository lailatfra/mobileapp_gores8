import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gores8_app/settings.dart';
import 'karyadisukai.dart';
import 'leaderboard.dart';

class StatistikPage extends StatefulWidget {
  @override
  _StatistikPageState createState() => _StatistikPageState();
}

class _StatistikPageState extends State<StatistikPage> {
  String selectedYear = '2025';
  
  // Data untuk line chart (Jumlah Total Karya per Bulan)
  final List<FlSpot> lineChartData = [
    FlSpot(0, 90),  // Jan
    FlSpot(1, 85),  // Feb
    FlSpot(2, 75),  // Mar
    FlSpot(3, 80),  // Apr
    FlSpot(4, 60),  // Mei
    FlSpot(5, 0),  // Jun
    FlSpot(6, 0),  // Jul
    FlSpot(7, 0),  // Agu
    FlSpot(8, 0),  // Sep
    FlSpot(9, 0),  // Okt
    FlSpot(10, 0), // Nov
    FlSpot(11, 0), // Des
  ];
  
  // Data untuk bar chart (Upload Karya per Bulan)
  final List<BarChartGroupData> barChartData = [
    makeGroupData(0, 4),  // Jan
    makeGroupData(1, 5),  // Feb
    makeGroupData(2, 4),  // Mar
    makeGroupData(3, 3),  // Apr
    makeGroupData(4, 1),  // Mei
    makeGroupData(5, 0),   // Jun
    makeGroupData(6, 0),  // Jul
    makeGroupData(7, 0),  // Agu
    makeGroupData(8, 0),  // Sep
    makeGroupData(9, 0),  // Okt
    makeGroupData(10, 0), // Nov
    makeGroupData(11, 0), // Des
  ];

  final List<String> months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
    'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
  ];

  static BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Color(0xFF142C57),
          width: 20,
          borderRadius: BorderRadius.circular(2),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color(0xFF142C57),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0, // 🔧 Kunci untuk mendekatkan judul ke leading icon
        title: Text(
          'Statistik Data',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            // Line Chart Section
            Text(
              'Jumlah Total Karya per Bulan',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF142C57)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.5,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 20,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey[300],
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 20,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10,
                                ),
                              );
                            },
                            reservedSize: 30,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              if (value.toInt() >= 0 && value.toInt() < months.length) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text(
                                    months[value.toInt()],
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              }
                              return Text('');
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 100,
                      lineBarsData: [
                        LineChartBarData(
                          spots: lineChartData,
                          isCurved: false,
                          color: Color(0xFF142C57),
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) =>
                                FlDotCirclePainter(
                              radius: 4,
                              color: Color(0xFF142C57),
                              strokeWidth: 0,
                            ),
                          ),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 24),
            
            // Menu Buttons
            _buildMenuButton(context, 'Karya yang disukai', Icons.thumb_up, const FavoriteWorksPage()),
            SizedBox(height: 12),
            _buildMenuButton(context, 'Pengaturan', Icons.settings, SettingsScreen()),


            SizedBox(height: 24),
            
            Text(
              'Lencana Terbanyak',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF142C57)),
              ),
              child: Column(
                children: [
                  Text(
                    'LEADERBOARD',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(221, 83, 83, 83),
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildLeaderboardItem(1, 'assets/profil/exawinandya.png', 'Exa Winandya', 49.8),
                  SizedBox(height: 12),
                  _buildLeaderboardItem(2, 'assets/profil/dinatalastie.png', 'Dinata Lastie', 40.0),
                  SizedBox(height: 12),
                  _buildLeaderboardItem(3, 'assets/profil/sialatifarahmawati.png', 'Sia Latifa Rahmawati', 29.1),
                  SizedBox(height: 12),
                  _buildLeaderboardItem(4, 'assets/profil/gavinsantana.png', 'Gavin Santana', 26.8),
                  SizedBox(height: 12),
                  _buildLeaderboardItem(5, 'assets/profil/lidyaesandry.png', 'Lidya Esandry', 26.7),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LihatSemuaLeaderboardPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Lihat Semua',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey[600],
                          size: 18,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            // Bar Chart Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jumlah Upload Karya Anda per Bulan',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF142C57)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: DropdownButton<String>(
                    value: selectedYear,
                    underline: SizedBox(),
                    icon: Icon(Icons.keyboard_arrow_down, size: 18),
                    items: ['2023', '2024', '2025'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 12),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedYear = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 16),
            
            Container(
              height: 250,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF142C57)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.5,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 5,
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.blueGrey.shade50,
                          tooltipPadding: const EdgeInsets.all(8),
                          tooltipMargin: 8,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            return BarTooltipItem(
                              rod.toY.toString(),
                              const TextStyle(
                                color: Color(0xFF142C57),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),

                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              if (value.toInt() >= 0 && value.toInt() < months.length) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text(
                                    months[value.toInt()],
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              }
                              return Text('');
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(show: false),
                      barGroups: barChartData,
                      gridData: FlGridData(show: false),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }



  Widget _buildLeaderboardItem(int rank, String image, String name, double percentage) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Rank number
          Container(
            width: 25,
            child: Text(
              rank.toString(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(221, 83, 83, 83),
              ),
            ),
          ),
          SizedBox(width: 4),

          // Avatar image
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            child: ClipOval(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 12),

          // Name and progress bar
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6),

                // Progress bar
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percentage / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF142C57),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




  Widget _buildMenuButton(BuildContext context, String label, IconData icon, Widget page) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF142C57)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        leading: Icon(icon, color: Color(0xFF142C57), size: 16),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}

class RiwayatKomentarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Komentar'),
        backgroundColor: Color(0xFF3E5C76),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Halaman Riwayat Komentar'),
      ),
    );
  }
}
