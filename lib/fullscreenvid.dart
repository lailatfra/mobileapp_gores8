import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'ulasan_widget.dart';


class FullscreenVideoPlayer extends StatefulWidget {
  final String videoPath;

  const FullscreenVideoPlayer({Key? key, required this.videoPath}) : super(key: key);

  @override
  State<FullscreenVideoPlayer> createState() => _FullscreenVideoPlayerState();
}

class _FullscreenVideoPlayerState extends State<FullscreenVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController,
            autoPlay: true,
            looping: false,
            fullScreenByDefault: false,
          );
        });
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  final komentarController = TextEditingController();

  void _showReviewBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.65,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ulasan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Divider(thickness: 1, height: 20),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        ulasanTile(
                          nama: 'Exa Winandya',
                          komentar: 'Bagus banget',
                          imageUrl: 'https://via.placeholder.com/40',
                          liked: false,
                          likeCount: 1,
                        ),
                        ulasanTile(
                          nama: 'Dinata Lastie',
                          komentar: 'Bagus',
                          imageUrl: 'https://via.placeholder.com/40',
                          liked: true,
                          likeCount: 3,
                        ),
                        ulasanTile(
                          nama: 'Sia Latifa Rahmawati',
                          komentar: 'Kalimatnya indah',
                          imageUrl: 'https://via.placeholder.com/40',
                          liked: false,
                          likeCount: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: komentarController,
                          decoration: InputDecoration(
                            hintText: 'Ketik Ulasan',
                            fillColor: Colors.grey[200],
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: const Color(0xFF1D3250),
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                            String komentar = komentarController.text;
                            if (komentar.isNotEmpty) {
                              // Tambahkan logika untuk menyimpan komentar
                              print('Komentar dikirim: $komentar');
                              komentarController.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video player
          Positioned.fill(
            child: _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(controller: _chewieController!)
                : const Center(child: CircularProgressIndicator()),
          ),

          // Overlay buttons (back, like, ulasan)
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                // Like + Ulasan
                Row(
                  children: [
                    // Like Button
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                        color: isLiked ? Colors.blue : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),

                    // Lihat Ulasan Button
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: _showReviewBottomSheet,
                      child: const Text("Lihat Ulasan"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
