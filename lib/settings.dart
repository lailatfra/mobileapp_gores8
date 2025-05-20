import 'package:flutter/material.dart';
import 'package:gores8_app/notification.dart';
import 'eventnav.dart';
import 'karyadisukai.dart';
import 'profile.dart';
import 'editprofile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF142C57),
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Pengaturan Akun',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Menu items
          _buildMenuItem(
            context,
            Icons.person,
            'Lihat Profil',
            
            () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          const Divider(height: 1),
          
          _buildMenuItem(
            context,
            Icons.person,
            'Edit Profil',
            
            () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EditProfilPage()),
              );
            },
          ),
          const Divider(height: 1),
          
          _buildMenuItem(
            context,
            Icons.notifications,
            'Notifikasi',
            () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            },
          ),
          const Divider(height: 1),
          
          _buildMenuItem(
            context,
            Icons.thumb_up,
            'Karya yang Kamu sukai',
            () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FavoriteWorksPage()),
              );
            },
          ),
          const Divider(height: 1),
          
          _buildMenuItem(
            context,
            Icons.event,
            'Event',
            () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventPage()),
              );
            },
          ),
          const Divider(height: 1),
          
          // Spacer to push buttons to the bottom
          const Spacer(),
          
          // Bottom buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text('Logout', style: TextStyle(color: Colors.white, fontSize: 13)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC42C2C),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Handle logout
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.sync, color: Colors.white),
                    label: const Text('Beralih Akun', style: TextStyle(color: Colors.white, fontSize: 13)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F3A63),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Handle switch account
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData iconData,
    String title,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              iconData,
              color: const Color(0xFF142C57),
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

