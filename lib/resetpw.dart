import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GORESS Password Reset',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'Roboto',
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const ResetPasswordScreen(),
//     );
//   }
// }

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final List<TextEditingController> _verificationCodeControllers = List.generate(4, (_) => TextEditingController());
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    for (var controller in _verificationCodeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

void _showVerificationCodeSentDialog() {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        'Kode verifikasi berhasil terkirim',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black.withOpacity(0.8),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    final double waveHeight = isKeyboardVisible ? 180 : 300;

    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(height: 16),
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          // Wave background
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
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                          child: Stack(
                            children: [
                              // Black feather
                              Positioned(
                                left: 20,
                                child: Icon(Icons.brush, size: 30, color: Colors.black),
                              ),
                              // White feather
                              Positioned(
                                right: 20,
                                child: Icon(Icons.brush, size: 30, color: Colors.white.withAlpha((0.8 * 255).toInt()),),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'GORESS',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),

          // Reset Password form
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 180, 30, 30),
              child: Column(
                children: [
                  const Text(
                    'ATUR ULANG PASSWORD',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Password field
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword, // true = titik-titik, false = terlihat
                    style: const TextStyle(color: Color.fromARGB(255, 49, 49, 49)),
                    decoration: InputDecoration(
                      hintText: 'Masukkan Kata Password',
                      hintStyle: const TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Confirm Password field
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword, // true = titik-titik, false = terlihat
                    style: const TextStyle(color: Color.fromARGB(255, 49, 49, 49)),
                    decoration: InputDecoration(
                      hintText: 'Masukkan Kata Password, Sekali Lagi',
                      hintStyle: const TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Verification code boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (index) => Container(
                        width: 70,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          controller: _verificationCodeControllers[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Send verification code text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        _showVerificationCodeSentDialog();
                      },
                      child: const Text(
                        'Kirim kode verifikasi',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),

                  
                  const SizedBox(height: 30),
                  
                  // Atur Ulang button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'Password berhasil diubah.');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D3250),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Atur Ulang',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Tombol Batalkan di kanan bawah
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Batalkan',
                        style: TextStyle(
                          color: Color.fromARGB(255, 66, 66, 66),
                          fontWeight: FontWeight.normal,
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
    );
  }
}

// Custom painter for the wave effect
class WavePainter extends CustomPainter {
  final double waveHeight;
  WavePainter(this.waveHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF1D3250);

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