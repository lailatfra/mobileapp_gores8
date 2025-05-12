import 'package:flutter/material.dart';
import 'event.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PuisiEventPage()),
            );
          },
          child: const Text('Ke Halaman Event'),
        ),
      ),
    );
  }
}
