import 'package:flutter/material.dart';

class PoemDetailPage extends StatefulWidget {
  const PoemDetailPage({super.key});

  @override
  State<PoemDetailPage> createState() => _PoemDetailPageState();
}

class _PoemDetailPageState extends State<PoemDetailPage> {
  bool isMainLiked = false;
  int mainLikeCount = 40;

  void toggleMainLike() {
    setState(() {
      isMainLiked = !isMainLiked;
      mainLikeCount += isMainLiked ? 1 : -1;
    });
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
                  color: const Color(0xFF1D3250),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/duniawi.jpg',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 85),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.calendar_month, size: 15, color: Color(0xFF1D3250)),
                      SizedBox(width: 6),
                      Text(
                        '22 Mei 2025',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 92, 92, 92),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D3250),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        ),
                        child: const Text(
                          'Buat Puisi Versimu!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.local_fire_department,
                        size: 24,
                        color: Color(0xFF1D3250),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Duniawi',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 13, color: Colors.black),
                    children: [
                      TextSpan(text: 'Karya ', style: TextStyle(fontWeight: FontWeight.w300)),
                      TextSpan(text: 'Exa Winandya VIII A', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pendidikan adalah tangga harapan\n'
                  'Tangga itu menuntun manusia untuk mencapai tujuan\n'
                  'Semua manusia berhak untuk menggunakan\n'
                  'Untuk mengubah mimpi menjadi kenyataan\n\n'
                  'Tangga itu tidak boleh disembunyikan\n'
                  'Dari semua insan yang ingin perubahan\n'
                  'Tangga tersebut tidak boleh disalahgunakan\n'
                  'Hanya untuk meraih keuntungan\n\n'
                  'Tangga itu harus benar-benar kuat\n'
                  'Agar mampu merubah manusia menjadi bermartabat\n'
                  'Tangga tersebut harus selalu dirawat\n'
                  'Agar bisa membimbing kita meraih akal sehat\n\n'
                  'Tangga itu harus bisa beradaptasi\n'
                  'Dari zaman yang begitu kencang berlari\n'
                  'Tangga itu tidak boleh dinodai\n'
                  'Agar bisa mengantar kita menjadi manusia bermoral yang hakiki\n',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 13,
                    color: Color.fromARGB(255, 65, 65, 65),
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),

            const Divider(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: toggleMainLike,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('$mainLikeCount', style: const TextStyle(fontSize: 15)),
                    const SizedBox(width: 4),
                    Icon(
                      isMainLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                      size: 20,
                      color: const Color(0xFF1D3250),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lihat Karya Lain',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Column(
              children: const [
                OtherPoemCard(
                  title: 'Ketenangan Jiwa',
                  subtitle: 'Lukisan Pemandangan Alam',
                  date: '25 April 2025',
                  likeCount: 30,
                  isLiked: true,
                  imagePath: 'assets/images/pemandangan.jpg',
                ),
                OtherPoemCard(
                  title: 'Ilmu Pedoman Hidup',
                  subtitle: 'Di kala mentari merekah\nBergegas melangkahkan ....',
                  date: '20 April 2025',
                  likeCount: 22,
                  isLiked: false,
                  imagePath: 'assets/images/pedomanhidup.jpg',
                ),
                OtherPoemCard(
                  title: 'Cermin Kehidupan',
                  subtitle: '',
                  date: '20 April 2025',
                  likeCount: 22,
                  isLiked: false,
                  imagePath: 'assets/images/cermin_hias.jpg',
                ),
              ],
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class OtherPoemCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String date;
  final int likeCount;
  final String imagePath;
  final bool isLiked;

  const OtherPoemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.likeCount,
    required this.imagePath,
    required this.isLiked,
  });

  @override
  State<OtherPoemCard> createState() => _OtherPoemCardState();
}

class _OtherPoemCardState extends State<OtherPoemCard> {
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    likeCount = widget.likeCount;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF1D3250)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.imagePath,
                  width: 64,
                  height: 74,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.blueGrey),
                      ],
                    ),
                    if (widget.subtitle.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          widget.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, size: 14, color: Colors.blueGrey),
                        const SizedBox(width: 4),
                        Text(
                          widget.date,
                          style: const TextStyle(fontSize: 12),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: toggleLike,
                          child: Row(
                            children: [
                              Text(
                                '$likeCount',
                                style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 43, 43, 43)),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                                size: 16,
                                color: const Color(0xFF1D3250),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}