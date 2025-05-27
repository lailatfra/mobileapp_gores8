import 'package:flutter/material.dart';
import 'anggota_data.dart';
import 'detail_anggota.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _AnggotaPageState();
}

class _AnggotaPageState extends State<UsersScreen> {
  
  List<int> statusList = [];

  int currentPage = 1;
  final int itemsPerPage = 15;

  @override
  void initState() {
    super.initState();

    statusList = anggotaList.map((anggota) {
      return anggota['pengikut'] == true ? 0 : 2;
    }).toList();
  }

  void toggleStatus(int index) {
    int globalIndex = (currentPage - 1) * itemsPerPage + index;
    if (globalIndex < statusList.length) {
      setState(() {
        statusList[globalIndex] = (statusList[globalIndex] == 2) ? 0 : 2;
      });
    }
  }

  Widget buildStatusButton(int status, int index) {
    String label = status == 2 ? 'Mengikuti' : 'Ikuti';

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
        backgroundColor: const Color(0xFF142C57),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: const Text(
          'Anggota',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: visibleItems.length,
              itemBuilder: (context, index) {
                final anggota = visibleItems[index];
                int globalIndex = startIndex + index;
                
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailAnggotaPage(
                          nama: anggota['nama'],
                          kelas: anggota['kelas'],
                          foto: anggota['foto'],
                          defaultPengikut: anggota['pengikut'] ?? false,
                        ),
                      ),
                    );
                  },
                  child: Padding(
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
                        globalIndex < statusList.length 
                          ? buildStatusButton(statusList[globalIndex], index)
                          : buildStatusButton(2, index),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: totalPages > 1 ? Padding(
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
              if (i > 0 && i <= totalPages)
                paginationButton('$i', selected: currentPage == i, onTap: () => setState(() => currentPage = i)),

            // Ellipsis sebelum halaman terakhir
            if (currentPage < totalPages - 2)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text('...'),
              ),

            // Tombol halaman terakhir
            if (currentPage < totalPages - 1)
              paginationButton('$totalPages', selected: currentPage == totalPages, onTap: () => setState(() => currentPage = totalPages)),

            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: currentPage < totalPages
                  ? () => setState(() => currentPage++)
                  : null,
            ),
          ],
        ),
      ) : null,
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