import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _AnggotaPageState();
}

class _AnggotaPageState extends State<UsersScreen> {
  final List<Map<String, dynamic>> anggotaList = [
    {'nama': 'Exa Winandya', 'kelas': 'VIII A', 'foto': 'assets/profil/exawinandya.png'},
    {'nama': 'Dinata Lastie', 'kelas': 'VII E', 'foto': 'assets/profil/dinatalastie.png'},
    {'nama': 'Sia Latifa Rahmawati', 'kelas': 'VIII E', 'foto': 'assets/profil/sialatifarahmawati.png'},
    {'nama': 'Gavin Santana', 'kelas': 'VIII I', 'foto': 'assets/profil/gavinsantana.png'},
    {'nama': 'Lidya Esandry', 'kelas': 'VIII E', 'foto': 'assets/profil/lidyaesandry.png'},
    {'nama': 'Cassius Renno', 'kelas': 'VII F', 'foto': 'assets/profil/cassiusreno.png'},
    {'nama': 'Alleric Emier', 'kelas': 'IX F', 'foto': 'assets/allericemier.png'},
    {'nama': 'Bhaskara Hadrian Athala', 'kelas': 'VII C', 'foto': 'assets/profil/bhaskarahadrianathala.png'},
    {'nama': 'Agatha Luisa Arsyila', 'kelas': 'IX G', 'foto': 'assets/profil/agathaluisaarsyla.png'},
  ];

  List<int> statusList = List.generate(9, (_) => 0);

  int currentPage = 1;
  final int itemsPerPage = 3;

  void toggleStatus(int index) {
    int globalIndex = (currentPage - 1) * itemsPerPage + index;
    setState(() {
      if (statusList[globalIndex] == 0) {
        statusList[globalIndex] = 1;
      } else if (statusList[globalIndex] == 1) {
        statusList[globalIndex] = 2;
      } else {
        statusList[globalIndex] = 1;
      }
    });
  }

  Widget buildStatusButton(int status, int index) {
    String label;
    switch (status) {
      case 0:
        label = 'Ikuti';
        break;
      case 1:
        label = 'Berteman';
        break;
      case 2:
        label = 'Mengikuti';
        break;
      default:
        label = 'Ikuti';
    }

    return OutlinedButton(
      onPressed: () => toggleStatus(index),
      style: OutlinedButton.styleFrom(
        backgroundColor: status == 0 ? const Color(0xFF142C57) : Colors.white,
        side: const BorderSide(color: Color(0xFF142C57)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: status == 0 ? Colors.white : const Color(0xFF142C57),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = (anggotaList.length / itemsPerPage).ceil();
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = (startIndex + itemsPerPage).clamp(0, anggotaList.length);
    List<Map<String, dynamic>> visibleItems = anggotaList.sublist(startIndex, endIndex);

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
                      'Anggota',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10), // Tambahkan jarak di sini
          Expanded(
            child: ListView.builder(
              itemCount: visibleItems.length,
              itemBuilder: (context, index) {
                final anggota = visibleItems[index];
                int globalIndex = startIndex + index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(anggota['foto']),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              anggota['nama'],
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              anggota['kelas'],
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      buildStatusButton(statusList[globalIndex], index),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= totalPages; i++) paginationButton('$i', selected: currentPage == i, onTap: () {
              setState(() {
                currentPage = i;
              });
            }),
            if (currentPage < totalPages)
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  setState(() {
                    if (currentPage < totalPages) currentPage++;
                  });
                },
              )
          ],
        ),
      ),
    );
  }

  Widget paginationButton(String text, {bool selected = false, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          minimumSize: const Size(36, 36),
          backgroundColor: selected ? const Color(0xFF142C57) : Colors.white,
          side: const BorderSide(color: Color(0xFF142C57)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          text,
          style: TextStyle(color: selected ? Colors.white : const Color(0xFF142C57)),
        ),
      ),
    );
  }
}
