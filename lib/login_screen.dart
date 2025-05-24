import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'register_screen.dart'; // Import halaman register (pastikan path sesuai)
import 'resetpw.dart';


class LoginScreen extends StatefulWidget {
  final String? message; // tambahkan ini

  const LoginScreen({super.key, this.message}); // tambahkan parameter ini

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tampilkan snackbar jika ada pesan
    if (widget.message != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.message!),
            backgroundColor: Colors.black.withOpacity(0.9),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            duration: const Duration(seconds: 4),
          ),
        );
      });
    }

    // Cek apakah keyboard muncul
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    // Kalau keyboard muncul, tinggi wave dipendekkan
    final double waveHeight = isKeyboardVisible ? 180 : 300;

    return Scaffold(
      
      body: Stack(
        children: [

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
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: _toggleVisibility,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),

                  // TextField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     hintText: 'Password',
                  //     suffixIcon: Icon(Icons.visibility),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ResetPasswordScreen()),
                        );

                        if (result != null && result is String) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(result),
                              backgroundColor: Colors.black.withOpacity(0.9),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              duration: const Duration(seconds: 4),
                            ),
                          );
                        }

                      },
                      child: Text(
                        'Lupa Password?',
                        style: TextStyle(
                          color: Colors.grey[600],
                          // decoration: TextDecoration.underline, // opsional, supaya kelihatan clickable
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/main');
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

