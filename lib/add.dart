import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});


  @override
  UploadKaryaPageState createState() => UploadKaryaPageState();
}

class UploadKaryaPageState extends State<AddScreen> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  DateTime? selectedDate;
  String? selectedEvent;
  String? selectedFileName;

  final List<String> events = ['Buatlah Puisi Versimu!', 'Karya Lukis'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'mp4', 'mov'],
    );

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
      // Kamu bisa simpan path filenya atau langsung kirim ke server
    }
  }

  @override
  Widget build(BuildContext context) {
    const double fontSize = 14;

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
                  const SizedBox(height: 16), // ini setara dengan `top: 16`
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Notifikasi',
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Judul', style: TextStyle(fontSize: fontSize)),
            const SizedBox(height: 8),
            TextField(
              controller: _judulController,
              style: TextStyle(fontSize: fontSize),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text('Konten/Deskripsi', style: TextStyle(fontSize: fontSize)),
            const SizedBox(height: 8),
            TextField(
              controller: _deskripsiController,
              maxLines: 5,
              style: TextStyle(fontSize: fontSize),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1C3256),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: _pickFile,
              child: Text('Upload Foto/Video', style: TextStyle(fontSize: fontSize, color: Colors.white)),
            ),
            if (selectedFileName != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'File terpilih: $selectedFileName',
                  style: TextStyle(fontSize: fontSize, color: Colors.grey[600]),
                ),
              ),
            const SizedBox(height: 16),
            const Text('Pilih Tanggal', style: TextStyle(fontSize: fontSize)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  style: TextStyle(fontSize: fontSize),
                  decoration: InputDecoration(
                    hintText: 'dd/mm/yyyy',
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  controller: TextEditingController(
                    text: selectedDate == null
                        ? ''
                        : '${selectedDate!.day.toString().padLeft(2, '0')}/${selectedDate!.month.toString().padLeft(2, '0')}/${selectedDate!.year}',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Pilih Event yang sedang berlangsung (Optional)',
                style: TextStyle(fontSize: fontSize)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedEvent,
              style: TextStyle(fontSize: fontSize, color: Colors.black),
              items: events
                  .map((event) => DropdownMenuItem(
                        value: event,
                        child: Text(event, style: TextStyle(fontSize: fontSize)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedEvent = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Pilih Event',
                hintStyle: TextStyle(fontSize: fontSize),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aksi submit
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1C3256),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text('Kirim', style: TextStyle(fontSize: fontSize, color: Colors.white)),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
