import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({super.key});


  @override
  EditProfilPageState createState() => EditProfilPageState();
}

class EditProfilPageState extends State<EditProfilPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Initialize with default values
    _usernameController.text = "Lenora Annie";
    _classController.text = "VIII A";
    _noteController.text = "https://www.instagram.com/lenoraannie_/";
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Pilih dari Galeri'),
                  onTap: () {
                    _getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Ambil Foto'),
                  onTap: () {
                    _getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 160,
                  color: const Color(0xFF1F3556),
                ),
                Positioned(
                  top: 16,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 56,
                            backgroundImage: _imageFile != null
                                ? FileImage(_imageFile!)
                                : AssetImage('assets/profil/lenoraannie.png') as ImageProvider,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.change_circle,
                                color: Color(0xFF1F3556),
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username Field
                  Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      style: TextStyle( // 👈 ini untuk ukuran font dalam form
                        fontSize: 13,   // ubah ukuran sesuai keinginan
                        color: const Color.fromARGB(221, 48, 48, 48),
                      ),
                      controller: _usernameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Class Field
                  Text(
                    'Kelas',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      style: TextStyle( // 👈 ini untuk ukuran font dalam form
                        fontSize: 13,   // ubah ukuran sesuai keinginan
                        color: const Color.fromARGB(221, 48, 48, 48),
                      ),
                      controller: _classController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Notes Field
                  Text(
                    'Catatan',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      style: TextStyle( // 👈 ini untuk ukuran font dalam form
                        fontSize: 13,   // ubah ukuran sesuai keinginan
                        color: const Color.fromARGB(221, 48, 48, 48),
                      ),
                      controller: _noteController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  
                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle save functionality
                        _saveProfile();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F3556),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Ubah',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProfile() {
    // You can implement your save logic here
    // For example, save to local storage, send to API, etc.
    
    // String username = _usernameController.text;
    // String className = _classController.text;
    // String notes = _noteController.text;
    
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profil berhasil diubah!'),
        backgroundColor: Colors.green,
      ),
    );
    
    // Navigate back or perform other actions
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _classController.dispose();
    _noteController.dispose();
    super.dispose();
  }
}