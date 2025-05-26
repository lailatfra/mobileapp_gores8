import 'package:flutter/material.dart';
import 'anggota_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredAnggota = [];
  List<int> statusList = [];

  int currentPage = 1;
  final int itemsPerPage = 15;

  @override
  void initState() {
    super.initState();

    // Atur status default berdasarkan nama atau logika tertentu
    statusList = anggotaList.map((anggota) {
      if (anggota['nama']!.contains('a')) {
        return 2; // Mengikuti (default putih)
      } else {
        return 0; // Ikuti (default biru)
      }
    }).toList();
  }


  void onSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredAnggota = anggotaList;
      } else {
        filteredAnggota = anggotaList.where((anggota) {
          final nama = anggota['nama']!.toLowerCase();
          final kelas = anggota['kelas']!.toLowerCase();
          final q = query.toLowerCase();
          return nama.contains(q) || kelas.contains(q);
        }).toList();
      }
    });
  }

  void toggleStatus(int index) {
    int globalIndex = (currentPage - 1) * itemsPerPage + index;
    setState(() {
      statusList[globalIndex] = (statusList[globalIndex] == 2) ? 0 : 2;
    });
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
      backgroundColor: const Color(0xFF142C57),
      appBar: AppBar(
        backgroundColor: const Color(0xFF142C57),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: const Text(
          'Cari',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF1D3250)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: onSearch,
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  const Icon(Icons.search, color: Color(0xFF1D3250)),
                ],
              ),
            ),
          ),

          // Tampilkan hasil
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: filteredAnggota.length,
                itemBuilder: (context, index) {
                  final anggota = filteredAnggota[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(anggota['foto']!),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                anggota['nama']!,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                anggota['kelas']!,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        buildStatusButton(statusList[index], index),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
