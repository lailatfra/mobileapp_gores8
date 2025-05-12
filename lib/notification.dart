import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'name': 'Exa Winandya',
        'avatar': 'assets/profil/exawinandya.png',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '18 Mei 2025',
        'action': '',
        'isFriendRequest': false,
      },
      {
        'name': 'Exa Winandya',
        'avatar': 'assets/profil/exawinandya.png',
        'message': 'Mengikutimu.',
        'date': '18 Mei 2025',
        'action': 'Berteman',
        'isFriendRequest': true,
      },
      {
        'name': 'Dinata Lastie',
        'avatar': 'assets/profil/dinatalastie.png',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '16 Mei 2025',
        'action': '',
        'isFriendRequest': false,
      },
      {
        'name': 'Sia Latifa Rahmawati',
        'avatar': 'assets/profil/sialatifarahmawati.png',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '15 Mei 2025',
        'action': 'Ikuti',
        'isFriendRequest': true,
      },
      {
        'name': 'Gavin Santana',
        'avatar': 'assets/profil/gavinsantana.png',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '10 Mei 2025',
        'action': '',
        'isFriendRequest': false,
      },
      {
        'name': 'Binara Risyla',
        'avatar': 'assets/profil/binararisyla.png',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '3 April 2025',
        'action': '',
        'isFriendRequest': false,
      },
      {
        'name': 'Bhaskara Hadrian Athala',
        'avatar': 'assets/profil/bhaskarahadrianathala.png',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '18 April 2025',
        'action': '',
        'isFriendRequest': false,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // Tinggi AppBar
        child: AppBar(
          automaticallyImplyLeading: false, // Jangan pakai leading default
          backgroundColor: const Color(0xFF142C57),
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tombol back
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 10),
                  // Judul
                  const Padding(
                    padding: EdgeInsets.only(left: 16), // Tambah padding kiri
                    child: Text(
                      'Notifikasi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
      
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          final String name = notif['name'].toString();
          final String avatar = notif['avatar'].toString();
          final String message = notif['message'].toString();
          final String date = notif['date'].toString();
          final String action = notif['action'].toString();
          final bool isFriendRequest = notif['isFriendRequest'] as bool;

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(avatar),
              radius: 24,
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13),
                  ),
                  TextSpan(
                    text: ' $message ',
                    style: const TextStyle(color: Color.fromARGB(255, 78, 78, 78), fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                  if (!isFriendRequest)
                    const TextSpan(
                      text: 'Lihat Karya',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300, fontSize: 13),
                    ),
                ],
              ),
            ),
            subtitle: Text(
              date,
              style: const TextStyle(fontSize: 10),
            ),
            trailing: action.isNotEmpty
                ? TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          action == 'Ikuti' ? const Color(0xFF142C57) : Colors.white,
                      side: action == 'Berteman'
                          ? const BorderSide(color: Colors.grey)
                          : BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    onPressed: () {},
                    child: Text(
                      action,
                      style: TextStyle(
                        color: action == 'Ikuti' ? Colors.white : Colors.black,
                        fontSize: 13, 
                      ),
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }
}
