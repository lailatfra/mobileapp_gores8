import 'package:flutter/material.dart';

Widget ulasanTile({
  required String nama,
  required String komentar,
  required String imageUrl,
  required bool liked,
  required int likeCount,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Text(
                komentar,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              color: liked ? Colors.indigo : Colors.grey,
              size: 20,
            ),
            const SizedBox(height: 2),
            Text(
              likeCount.toString(),
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}
