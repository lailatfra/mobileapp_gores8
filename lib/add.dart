import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
// import 'package:permission_handler/permission_handler.dart';

class AddScreen extends StatefulWidget {
  final void Function(int)? onTabChange;

  const AddScreen({Key? key, this.onTabChange}) : super(key: key);

  @override
  _AddScreen createState() => _AddScreen();
}

class _AddScreen extends State<AddScreen> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  
  File? _selectedFile;
  bool _isVideo = false;
  VideoPlayerController? _videoController;
  bool _tanpaFile = false;
  String _selectedEvent = 'Pilih Event';
  List<String> _eventOptions = [
    'Pilih Event',
    'Buatlah Puisi Versimu!',
    'Festival Sains dan Teknologi'
  ];

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    _tanggalController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Pilih Foto dari Galeri'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Ambil Foto dari Kamera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Pilih Video dari Galeri'),
                onTap: () {
                  Navigator.pop(context);
                  _pickVideo(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.video_camera_back),
                title: Text('Rekam Video'),
                onTap: () {
                  Navigator.pop(context);
                  _pickVideo(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
        _isVideo = false;
        _videoController?.dispose();
        _videoController = null;
      });
    }
  }

  Future<void> _pickVideo(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickVideo(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
        _isVideo = true;
      });
      
      _videoController = VideoPlayerController.file(_selectedFile!)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _tanggalController.text = 
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  void _submitForm() {
    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Silakan pilih file terlebih dahulu')),
      );
      return;
    }
    
    if (_judulController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Judul tidak boleh kosong')),
      );
      return;
    }

    // Proses upload data
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Karya berhasil diupload!')),
    );
    
    // Kembali ke halaman sebelumnya
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF142C57),
        elevation: 0,
        automaticallyImplyLeading: false, // ❌ Hilangkan tombol back
        title: const Padding(
          padding: EdgeInsets.only(left: 14), // ✅ Tambahkan padding kiri manual
          child: Text(
            'Upload Karyamu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // File Upload Section

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedFile == null ? 'Pilih File' : 'Ubah File',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(221, 71, 71, 71),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                
                
              ],
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: _pickFile,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _selectedFile == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud_upload_outlined,
                              size: 60, color: const Color.fromARGB(255, 94, 94, 94)),
                        ],
                      )
                    : _isVideo
                        ? _videoController != null &&
                                _videoController!.value.isInitialized
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: AspectRatio(
                                  aspectRatio:
                                      _videoController!.value.aspectRatio,
                                  child: VideoPlayer(_videoController!),
                                ),
                              )
                            : Center(child: CircularProgressIndicator())
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _selectedFile!,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
              ),
            ),

            SizedBox(height: 24),
            
            // Judul Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label Judul
                Text(
                  'Judul',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _judulController,
                  style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 92, 92, 92)),
                  decoration: InputDecoration(
                    hintText: 'Masukkan judul',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFF2E3A59)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                SizedBox(height: 24),

                // Label Konten/Deskripsi
                Text(
                  'Konten/Deskripsi',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _deskripsiController,
                  style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 92, 92, 92)),
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Masukkan konten/deskripsi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFF2E3A59)),
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ],
            ),

            
            SizedBox(height: 24),
            
            // Pilih Tanggal
            Text(
              'Pilih Tanggal',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            SizedBox(height: 8),
            
            GestureDetector(
              onTap: _selectDate,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _tanggalController.text.isEmpty 
                            ? 'dd/mm/yyyy' 
                            : _tanggalController.text,
                        style: TextStyle(
                          color: _tanggalController.text.isEmpty 
                              ? Colors.grey[600] 
                              : Colors.black,
                        ),
                      ),
                    ),
                    Icon(Icons.calendar_today, color: Colors.grey[600]),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 24),
            
            // Pilih Event
            Text(
              'Pilih Event yang sedang berlangsung (Opsional)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            SizedBox(height: 8),
            
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedEvent,
                  isExpanded: true,
                  style: const TextStyle(fontSize: 13, color: Color.fromARGB(255, 43, 43, 43)),
                  items: _eventOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedEvent = newValue!;
                    });
                  },
                ),
              ),
            ),
            
            SizedBox(height: 16),
            
            Text(
              '* Jika Event Tidak ada di dalam pilihan, mungkin event telah selesai atau error dan kesalahan jaringan.',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            
            SizedBox(height: 32),
            
            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2E3A59),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Kirim',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}