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
    {'nama': 'Exa Winandya', 'kelas': 'VIII A', 'foto': 'assets/profil/exawinandya.png'},
    {'nama': 'Dinata Lastie', 'kelas': 'VII E', 'foto': 'assets/profil/dinatalastie.png'},
    {'nama': 'Sia Latifa Rahmawati', 'kelas': 'VIII E', 'foto': 'assets/profil/sialatifarahmawati.png'},
    {'nama': 'Gavin Santana', 'kelas': 'VIII I', 'foto': 'assets/profil/gavinsantana.png'},
    {'nama': 'Lidya Esandry', 'kelas': 'VIII E', 'foto': 'assets/profil/lidyaesandry.png'},
    {'nama': 'Cassius Renno', 'kelas': 'VII F', 'foto': 'assets/profil/cassiusreno.png'},
    {'nama': 'Alleric Emier', 'kelas': 'IX F', 'foto': 'assets/allericemier.png'},
    {'nama': 'Bhaskara Hadrian Athala', 'kelas': 'VII C', 'foto': 'assets/profil/bhaskarahadrianathala.png'},
    {'nama': 'Agatha Luisa Arsyila', 'kelas': 'IX G', 'foto': 'assets/profil/agathaluisaarsyla.png'},
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
  final int itemsPerPage = 15;


  @override
  void initState() {
    super.initState();
    statusList = List.generate(anggotaList.length, (_) => 0);
  }

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
      
      appBar: AppBar(
        backgroundColor: Color(0xFF142C57),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Anggota',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
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
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: currentPage > 1
                  ? () => setState(() => currentPage--)
                  : null,
            ),

            // Tombol halaman pertama
            if (currentPage > 2)
              paginationButton('1', selected: currentPage == 1, onTap: () => setState(() => currentPage = 1)),

            // Ellipsis setelah halaman 1
            if (currentPage > 3)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text('...'),
              ),

            // Tombol sebelum, saat ini, dan sesudahnya
            for (int i = currentPage - 1; i <= currentPage + 1; i++)
              if (i > 1 && i < totalPages)
                paginationButton('$i', selected: currentPage == i, onTap: () => setState(() => currentPage = i)),

            // Ellipsis sebelum halaman terakhir
            if (currentPage < totalPages - 2)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text('...'),
              ),

            // Tombol halaman terakhir
            if (currentPage < totalPages)
              paginationButton('$totalPages', selected: currentPage == totalPages, onTap: () => setState(() => currentPage = totalPages)),

            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: currentPage < totalPages
                  ? () => setState(() => currentPage++)
                  : null,
            ),
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
