import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'name': 'Exa Winandya',
        'avatar': 'https://i.pravatar.cc/150?img=1',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '18 Mei 2025',
        'action': '',
        'isFriendRequest': false,
      },
      {
        'name': 'Exa Winandya',
        'avatar': 'https://i.pravatar.cc/150?img=2',
        'message': 'Mengikutimu.',
        'date': '18 Mei 2025',
        'action': 'Berteman',
        'isFriendRequest': true,
      },
      {
        'name': 'Dinata Lastie',
        'avatar': 'https://i.pravatar.cc/150?img=3',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '16 Mei 2025',
        'action': '',
        'isFriendRequest': false,
      },
      {
        'name': 'Sia Latifa Rahmawati',
        'avatar': 'https://i.pravatar.cc/150?img=4',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '15 Mei 2025',
        'action': 'Ikuti',
        'isFriendRequest': true,
      },
      {
        'name': 'Gavin Santana',
        'avatar': 'https://i.pravatar.cc/150?img=5',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '10 Mei 2025',
        'action': '',
        'isFriendRequest': false,
      },
      {
        'name': 'Binara Risyla',
        'avatar': 'https://i.pravatar.cc/150?img=6',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '3 April 2025',
        'action': '',
        'isFriendRequest': false,
      },
      {
        'name': 'Gavin Santana',
        'avatar': 'https://i.pravatar.cc/150?img=5',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '27 April 2025',
        'action': '',
        'isFriendRequest': false,
      },
      {
        'name': 'Bhaskara Hadrian Athala',
        'avatar': 'https://i.pravatar.cc/150?img=7',
        'message': 'Menyukai karyamu dengan judul Ketenangan Jiwa.',
        'date': '18 April 2025',
        'action': '',
        'isFriendRequest': false,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF142C57),
        title: const Text('Notifikasi', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: notifications.length,
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
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: ' $message ',
                    style: const TextStyle(color: Colors.black),
                  ),
                  if (!isFriendRequest)
                    const TextSpan(
                      text: 'Lihat Karya',
                      style: TextStyle(color: Colors.blue),
                    ),
                ],
              ),
            ),
            subtitle: Text(
              date,
              style: const TextStyle(fontSize: 12),
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
