import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({Key? key}) : super(key: key);

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  File? _imageFile;
  final picker = ImagePicker();

  final TextEditingController _usernameController =
      TextEditingController(text: 'Lenora Annie');
  final TextEditingController _kelasController = TextEditingController(text: 'VIII A');
  final TextEditingController _catatanController =
      TextEditingController(text: 'https://www.instagram.com/lenora_anniee/');

  Future<void> _pickImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      'Edit Profilmu',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Username"),
            _buildTextField(_usernameController),
            const SizedBox(height: 16),
            _buildLabel("Kelas/Role"),
            _buildTextField(_kelasController),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: _imageFile != null
                        ? Image.file(_imageFile!, width: 110, height: 110, fit: BoxFit.cover)
                        : Image.asset('assets/profil.png', width: 110, height: 110),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF142C57),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Ganti Profil"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildLabel("Catatan"),
            _buildTextField(_catatanController, maxLines: 4),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Simpan perubahan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF142C57),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Ubah"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 13, color: Colors.black),
    );
  }

  Widget _buildTextField(TextEditingController controller, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF142C57)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF142C57), width: 1.5),
        ),
      ),
    );
  }
}
