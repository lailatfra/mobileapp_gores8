import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // Track which notifications have been clicked
  Set<int> clickedNotifications = {};
  
  // Track follow/friend status for each user
  Map<int, bool> followStatus = {
    1: false, // Exa Winandya (Mengikutimu)
    4: false, // Sia Latifa Rahmawati
    5: false, // Gavin Santana
    6: false, // Binara Risyla
    7: true,  // Gavin Santana (already following)
  };

  List<NotificationItem> notifications = [
    NotificationItem(
      id: 0,
      name: "Exa Winandya",
      action: "Mengomentari Karya 'Ketenangan Jiwa' Bagus Karyanya...",
      additionalInfo: "Lihat Karya",
      time: "18 Mei 2025",
      avatar: "assets/profil/exawinandya.png",
      hasButton: false,
    ),
    NotificationItem(
      id: 1,
      name: "Exa Winandya",
      action: "Mengikutimu.",
      additionalInfo: "",
      time: "18 Mei 2025",
      avatar: "assets/profil/exawinandya.png",
      hasButton: true,
    ),
    NotificationItem(
      id: 2,
      name: "Dinata Lastie",
      action: "Menyukai karyamu dengan judul Ketenangan Jiwa.",
      additionalInfo: "Lihat Karya",
      time: "16 Mei 2025",
      avatar: "assets/profil/dinatalastie.png",
      hasButton: false,
    ),
    NotificationItem(
      id: 3,
      name: "Sia Latifa Rahmawati",
      action: "Menyukai karyamu dengan judul Ketenangan Jiwa.",
      additionalInfo: "Lihat Karya",
      time: "15 Mei 2025",
      avatar: "assets/profil/sialatifarahmawati.png",
      hasButton: false,
    ),
    NotificationItem(
      id: 4,
      name: "Gavin Santana",
      action: "Menyukai karyamu dengan judul Ketenangan Jiwa.",
      additionalInfo: "Lihat Karya",
      time: "10 Mei 2025",
      avatar: "assets/profil/gavinsantana.png",
      hasButton: false,
    ),
    NotificationItem(
      id: 5,
      name: "Binara Risyla",
      action: "Menyukai karyamu dengan judul Ketenangan Jiwa.",
      additionalInfo: "Lihat Karya",
      time: "3 April 2025",
      avatar: "assets/profil/binararisyla.png",
      hasButton: false,
    ),
    NotificationItem(
      id: 6,
      name: "Gavin Santana",
      action: "Mengikutimu.",
      additionalInfo: "",
      time: "27 April 2025",
      avatar: "assets/profil/gavinsantana.png",
      hasButton: true,
    ),
    NotificationItem(
      id: 7,
      name: "Bhaskara Hadrian Athala",
      action: "Menyukai karyamu dengan judul Ketenangan Jiwa.",
      additionalInfo: "Lihat Karya",
      time: "18 April 2025",
      avatar: "assets/profil/bhaskarahadrianathala.png",
      hasButton: false,
    ),
  ];

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
        titleSpacing: 0,
        title: Text(
          'Notifikasi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
      body: ListView.builder(
        padding: EdgeInsets.only(top: 14),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final bool isClicked = clickedNotifications.contains(notification.id);
          final bool isFollowing = followStatus[notification.id] ?? false;

          // Background cream hanya untuk 2 notifikasi pertama DAN belum diklik
          final bool showCreamBackground = index < 2 && !isClicked;

          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (clickedNotifications.contains(notification.id)) {
                      clickedNotifications.remove(notification.id);
                    } else {
                      clickedNotifications.add(notification.id);
                    }
                  });
                },
                child: Container(
                  color: showCreamBackground ? Color(0xFFF5E6D3) : Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Image dengan error handling
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(notification.avatar),
                        onBackgroundImageError: (exception, stackTrace) {
                          // Jika gambar tidak bisa dimuat, akan menampilkan child
                        },
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[600],
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 12),
                      
                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 14,
                                  color: const Color.fromARGB(221, 63, 63, 63),
                                  height: 1.3,
                                ),
                                children: [
                                  TextSpan(
                                    text: notification.name,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: ' ${notification.action}'),
                                  if (notification.additionalInfo.isNotEmpty)
                                    TextSpan(
                                      text: ' ${notification.additionalInfo}',
                                      style: TextStyle(
                                        color: Color(0xFF142C57),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              notification.time,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Button (if applicable)
                      if (notification.hasButton) ...[
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              followStatus[notification.id] = !isFollowing;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isFollowing ? Colors.white : Color(0xFF142C57),
                            foregroundColor: isFollowing ? Color(0xFF142C57) : Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            minimumSize: Size(0, 36),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(
                                color: Color(0xFF142C57),
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            isFollowing ? 'Berteman' : 'Ikuti',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              // Tambahkan jarak setelah item pertama (index 0) jika masih ada background cream
              if (index == 0 && showCreamBackground) 
                SizedBox(height: 4),
            ],
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final int id;
  final String name;
  final String action;
  final String additionalInfo;
  final String time;
  final String avatar;
  final bool hasButton;

  NotificationItem({
    required this.id,
    required this.name,
    required this.action,
    required this.additionalInfo,
    required this.time,
    required this.avatar,
    required this.hasButton,
  });
}