import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Import halaman-halaman jika sudah ada
import 'duniawi.dart';
// import 'pedoman_hidup_page.dart';
// import 'cermin_hias_page.dart';
// dst...

class FavoriteWorksPage extends StatelessWidget {
  const FavoriteWorksPage({super.key});

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
                      'Karya yang kamu sukai',
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
        padding: const EdgeInsets.all(16.0),
        child: buildKaryaContent(context),
      ),
    );
  }

  Widget buildKaryaContent(BuildContext context) {
    List<String> imagePaths = [
      'assets/images/duniawi.jpg',
      'assets/images/pedomanhidup.jpg',
      'assets/images/cermin_hias.jpg',
      'assets/images/banner_puisi.jpg',
      'assets/images/exawinandya.png',
      'assets/images/tari_menjeng.jpg',
    ];

    List<Widget> pages = [
      PoemDetailPage(),
      // CerminHiasPage(),
      // BannerPuisiPage(),
      // ExaWinandyaPage(),
      // TariMenjengPage(),
    ];

    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (index < pages.length) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pages[index]),
              );
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
