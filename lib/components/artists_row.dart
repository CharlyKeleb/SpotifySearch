import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArtistRow extends StatelessWidget {
  final String title;
  final String imgURL;

  const ArtistRow({super.key, required this.title, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading:  CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.grey.withOpacity(0.2),
          backgroundImage: CachedNetworkImageProvider(imgURL),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Gotham Light',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
