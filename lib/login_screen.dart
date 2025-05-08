import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'register_screen.dart'; // Import halaman register (pastikan path sesuai)
import 'package:get/get.dart';
import 'home.dart';
import 'main_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Cek apakah keyboard muncul
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    // Kalau keyboard muncul, tinggi wave dipendekkan
    final double waveHeight = isKeyboardVisible ? 180 : 300;

    return Scaffold(
      body: Stack(
        children: [
          // Wave background
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: Image.asset(
          //     'assets/images/wave.jpg',
          //     fit: BoxFit.fitWidth,
          //     height: waveHeight,
          //   ),
          // ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: waveHeight,
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width, waveHeight),
                painter: WavePainter(waveHeight),
              ),
            ),
          ),


          // Logo
          Positioned(
            top: isKeyboardVisible ? 50 : 100,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/images/logo_splash.jpeg',
                  width: 70,
                ),
              ),
            ),
          ),

          // Login form
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 250, 30, 30),
              child: Column(
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email/Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Lupa Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D3250),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Pengguna baru? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterScreen()),
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D3250),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1),
                  const Text('OR'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialButton(FontAwesomeIcons.twitter),
                      socialButton(FontAwesomeIcons.facebookF),
                      socialButton(FontAwesomeIcons.google),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget socialButton(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        backgroundColor: const Color(0xFF1D3250),
        child: FaIcon(icon, color: Colors.white),
      ),
    );
  }
}

// Tambahkan di luar class LoginScreen
class WavePainter extends CustomPainter {
  final double waveHeight;
  WavePainter(this.waveHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF1D3250); // warna biru tua

    final path = Path();
    path.lineTo(0, waveHeight);
    path.quadraticBezierTo(
      size.width * 0.25, waveHeight - 40,
      size.width * 0.5, waveHeight,
    );
    path.quadraticBezierTo(
      size.width * 0.75, waveHeight + 40,
      size.width, waveHeight,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

