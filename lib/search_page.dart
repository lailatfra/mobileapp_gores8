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

  @override
  void initState() {
    super.initState();
    filteredAnggota = anggotaList;
    statusList = List.generate(anggotaList.length, (_) => 0);
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
    setState(() {
      if (statusList[index] == 0) {
        statusList[index] = 1;
      } else if (statusList[index] == 1) {
        statusList[index] = 2;
      } else {
        statusList[index] = 1;
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
