import 'package:flutter/material.dart';

class MengikutiPengikutPage extends StatefulWidget {
  const MengikutiPengikutPage({super.key});

  @override
  State<MengikutiPengikutPage> createState() => _MengikutiPengikutPageState();
}

class _MengikutiPengikutPageState extends State<MengikutiPengikutPage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
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
                      'Exa Winandya',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTabButton("2 Diikuti", 0),
                buildTabButton("1 Pengikut", 1),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: selectedTab == 0 ? buildMengikutiContent() : buildPengikutContent(),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildTabButton(String text, int index) {
    bool isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                color: isSelected ? const Color(0xFF1F3556) : const Color.fromARGB(255, 46, 67, 99),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 2,
                color: isSelected ? const Color(0xFF1F3556) : Colors.transparent,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMengikutiContent() {
    final data = [
      {"nama": "Lenora Annie", "kelas": "VIII A", "status": ""},
      {"nama": "Dinata Lastie", "kelas": "VIII E", "status": "Berteman"},
      {"nama": "Exa Winandya", "kelas": "VIII E", "status": "Berteman"},
    ];

    return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = data[index];
        return buildUserTile(item["nama"]!, item["kelas"]!, item["status"]!);
      },
    );
  }

  Widget buildPengikutContent() {
    final data = [
      {"nama": "Cassius Reno", "kelas": "VIII E", "status": "Ikuti"},
      {"nama": "Bhaskara Hadrian Athala", "kelas": "VIII E", "status": "Ikuti"},
    ];

    return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = data[index];
        return buildUserTile(item["nama"]!, item["kelas"]!, item["status"]!);
      },
    );
  }

  Widget buildUserTile(String nama, String kelas, String status) {
    return Row(
      children: [
        const CircleAvatar(radius: 24, backgroundColor: Colors.grey),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nama, style: const TextStyle(fontSize: 14)),
              Text(kelas, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 32,
          child: status == "Berteman"
              ? OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  onPressed: () {},
                  child: const Text("Berteman", style: TextStyle(fontSize: 12)),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F3556),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  onPressed: () {},
                  child: const Text("Ikuti", style: TextStyle(fontSize: 12)),
                ),
        ),
      ],
    );
  }
}
