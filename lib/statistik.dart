import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gores8_app/settings.dart';
import 'karyadisukai.dart';

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
            _buildMenuButton(
              'Karya yang disukai', () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => FavoriteWorksPage(),
              ));
            }),
            
            SizedBox(height: 12),
            
            _buildMenuButton('Riwayat Komentar', () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => RiwayatKomentarPage(),
              ));
            }),
            
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
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.5,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 5,
                      barTouchData: BarTouchData(enabled: false),
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
            
            SizedBox(height: 24),
            
            _buildMenuButton('Pengaturan', () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => SettingsScreen(),
              ));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(String title, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF142C57)),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[600],
        ),
        onTap: onTap,
      ),
    );
  }
}

// Dummy pages for navigation
// class KaryaDisukaiPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Karya yang disukai'),
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Text('Halaman Karya yang disukai'),
//       ),
//     );
//   }
// }

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

// class PengaturanPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pengaturan'),
//         backgroundColor: Color(0xFF3E5C76),
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Text('Halaman Pengaturan'),
//       ),
//     );
//   }
// }