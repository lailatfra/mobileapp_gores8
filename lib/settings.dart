import 'package:flutter/material.dart';
import 'package:gores8_app/leaderboard.dart';
import 'package:gores8_app/login_screen.dart';
import 'package:gores8_app/statuskhusus.dart';
import 'eventnav.dart';
import 'karyadisukai.dart';
import 'notification.dart';
import 'editprofile.dart';
import 'users.dart';

class SettingsScreen extends StatelessWidget {
  final void Function(int)? onTabChange;

  const SettingsScreen({Key? key, this.onTabChange}) : super(key: key);

  void navigate(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(message: 'Berhasil logout'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }


  void _bukaHalamanStatus(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusKhususPage(), // Ganti dengan halaman status kamu
      ),
    );

    if (result != null && result is Map && result['showMessage'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Status berhasil disimpan!')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
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
          'Pengaturan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            const Text('Profil dan Member', style: TextStyle(fontWeight: FontWeight.normal, color: Color.fromARGB(255, 65, 65, 65))),
            const SizedBox(height: 8),
            _buildTabButton(context, 'Lihat Profil', Icons.person, 4, onTabChange),
            _buildButton(context, 'Edit Profil', Icons.edit, const EditProfilPage()),
            _buildButton(context, 'Anggota', Icons.group, const UsersScreen()),
            const SizedBox(height: 20),
            const Text('Aktivitas', style: TextStyle(fontWeight: FontWeight.normal, color: Color.fromARGB(255, 65, 65, 65))),
            const SizedBox(height: 8),
            _buildButton(context, 'Notifikasi', Icons.notifications, NotificationPage()),
            _buildButton(context, 'Karya yang disukai', Icons.thumb_up, const FavoriteWorksPage()),
            _buildButton(context, 'Leaderboard', Icons.leaderboard, LihatSemuaLeaderboardPage()),
            _buildButton(context, 'Event', Icons.local_fire_department, const EventPage()),
            _buildTabButton(context, 'Upload Karya', Icons.cloud_upload, 2, onTabChange),
            _buildButtonCallback(
              context,
              'Tampilkan Status sebagai Guru',
              Icons.book,
              () => _bukaHalamanStatus(context),
            ),

            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                onPressed: () => logout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 145, 23, 14),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 80)
          ],
        ),
      ),
    );
  }


  Widget _buildButtonCallback(BuildContext context, String label, IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(255, 71, 71, 71)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        leading: Icon(icon, color: Color(0xFF142C57), size: 20),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF142C57),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Color(0xFF142C57)),
        onTap: onTap,
      ),
    );
  }


  Widget _buildButton(BuildContext context, String label, IconData icon, Widget page) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(255, 71, 71, 71)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        leading: Icon(icon, color: Color(0xFF142C57), size: 20),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF142C57),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Color(0xFF142C57)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }

  Widget _buildTabButton(
    BuildContext context,
    String label,
    IconData icon,
    int targetTabIndex,
    void Function(int)? onTabChange, // ✅ Nullable
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(255, 71, 71, 71)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        leading: Icon(icon, color: Color(0xFF142C57), size: 20),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF142C57),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Color(0xFF142C57)),
        onTap: () {
          Navigator.pop(context); // Tutup SettingsScreen
          if (onTabChange != null) {
            onTabChange!(targetTabIndex); // Ganti tab utama
          }
        },

      ),
    );
  
  }
}


class LoginPage extends StatelessWidget {
  final String message;
  const LoginPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(child: Text(message, style: const TextStyle(color: Color.fromARGB(255, 83, 83, 83)))),
    );
  }
}
