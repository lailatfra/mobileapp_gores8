import 'package:flutter/material.dart';
import 'package:gores8_app/login_screen.dart';
import 'add.dart';
import 'eventnav.dart';
import 'karyadisukai.dart';
import 'notification.dart';
import 'profile.dart';
import 'editprofile.dart';
// import 'login_screen.dart';
import 'users.dart';
import 'statistik.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF142C57),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: const Text(
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
            const SizedBox(height: 18),
            const Text('Profil dan Member', style: TextStyle(fontWeight: FontWeight.normal, color: Color.fromARGB(255, 65, 65, 65))),
            const SizedBox(height: 8),
            _buildButton(context, 'Lihat Profil', Icons.person, const ProfileScreen()),
            _buildButton(context, 'Edit Profil', Icons.edit, const EditProfilPage()),
            _buildButton(context, 'Anggota', Icons.group, const UsersScreen()),
            const SizedBox(height: 18),
            const Text('Aktivitas', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildButton(context, 'Notifikasi', Icons.notifications, const NotificationPage()),
            _buildButton(context, 'Karya yang disukai', Icons.thumb_up, const FavoriteWorksPage()),
            _buildButton(context, 'Riwayat Komentar', Icons.comment, RiwayatKomentarPage()),
            _buildButton(context, 'Event', Icons.local_fire_department, const EventPage()),
            _buildButton(context, 'Statistik Data', Icons.bar_chart, StatistikPage()),
            _buildButton(context, 'Upload Karya', Icons.cloud_upload, AddScreen()),
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

  Widget _buildButton(BuildContext context, String label, IconData icon, Widget page) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(255, 71, 71, 71)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF142C57), size: 14),
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
}


class LoginPage extends StatelessWidget {
  final String message;
  const LoginPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(child: Text(message, style: const TextStyle(color: Colors.green))),
    );
  }
}
