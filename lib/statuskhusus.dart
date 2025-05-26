import 'package:flutter/material.dart';
import 'package:gores8_app/profile.dart';
import 'profile.dart';

class StatusKhususPage extends StatefulWidget {
  @override
  _StatusKhususPageState createState() => _StatusKhususPageState();
}

class _StatusKhususPageState extends State<StatusKhususPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();
  
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    // Set default values
    _usernameController.text = "Lenora Avnia";
    _emailController.text = "lenoraavnia@gmail.com";
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _kodeController.dispose();
    super.dispose();
  }

  void _tampilkan() {
    // Navigate ke profil page dengan parameter showMessage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(showSuccessMessage: true), // Ganti dengan nama class profil Anda
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF142C57),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0, // 🔧 Kunci untuk mendekatkan judul ke leading icon
        title: Text(
          'Status Khusus',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username Field
            Text(
              'Username',
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(221, 51, 51, 51),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Masukkan username',
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 83, 83, 83),
                  fontSize: 13,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF142C57), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),

            // Email Field
            Text(
              'Email',
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(221, 51, 51, 51),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Masukkan email',
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 88, 88, 88),
                  fontSize: 13,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF142C57), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),

            // Kode Guru/Khusus Field
            Text(
              'Kode Guru/Khusus',
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(221, 44, 44, 44),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _kodeController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Masukkan kode',
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 95, 95, 95),
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF142C57), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: const Color.fromARGB(255, 92, 92, 92),
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(height: 32),

            // Tampilkan Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _tampilkan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF142C57),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Tampilkan',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
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

// // Profile Page Example (tempat tujuan setelah klik Tampilkan)
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   void initState() {
//     super.initState();
//     // Show success message when page loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showSuccessMessage();
//     });
//   }

//   void _showSuccessMessage() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             Icon(Icons.check_circle, color: Colors.white, size: 20),
//             SizedBox(width: 8),
//             Text(
//               'Status telah berhasil diperbarui',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: const Color.fromARGB(255, 88, 88, 88),
//         duration: Duration(seconds: 3),
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         margin: EdgeInsets.all(16),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color(0xFF142C57),
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white, size: 20),
//           onPressed: () => Navigator.pop(context),
//         ),
//         titleSpacing: 0,
//         title: Text(
//           'Profil',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.person_outline,
//               size: 80,
//               color: Color(0xFF142C57),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Halaman Profil',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF142C57),
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Status Anda telah diperbarui',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Contoh penggunaan navigation
// class NavigationExample extends StatelessWidget {
//   void _navigateToStatusKhusus(BuildContext context) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => StatusKhususPage()),
//     );

//     // Jika ada result dari StatusKhususPage, navigate ke ProfilePage
//     if (result != null && result['showMessage'] == true) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ProfilePage()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Navigation Example')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => _navigateToStatusKhusus(context),
//           child: Text('Buka Status Khusus'),
//         ),
//       ),
//     );
//   }
// }