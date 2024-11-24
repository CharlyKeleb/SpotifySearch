import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/model/album_model.dart';

class AlbumCard extends StatelessWidget {
  final String title;
  final List<Artists> artist;
  final String year;
  final String type;
  final String imgURL;

  const AlbumCard({
    super.key,
    required this.title,
    required this.artist,
    required this.year,
    required this.type,
    required this.imgURL,
  });

  String get _formattedType =>
      "${type[0].toUpperCase()}${type.substring(1).toLowerCase()}";

  String get _formattedYear => year.split('-')[0];

  String get _artistNames => artist.isNotEmpty
      ? artist.map((a) => a.name).join(', ')
      : 'Unknown Artists';

  double _getCardWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width / 2 - 20;

  @override
  Widget build(BuildContext context) {
    final cardWidth = _getCardWidth(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAlbumImage(cardWidth),
        const SizedBox(height: 10),
        _buildTitle(cardWidth),
        const SizedBox(height: 5),
        _buildArtists(cardWidth),
        const SizedBox(height: 3),
        _buildMetadata(),
      ],
    );
  }

  Widget _buildAlbumImage(double width) {
    return CachedNetworkImage(
      height: 200,
      width: width,
      imageUrl: imgURL,
      placeholder: (context, url) => const CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error_outline),
      fit: BoxFit.cover,
    );
  }

  Widget _buildTitle(double width) {
    return SizedBox(
      width: width,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Gotham Bold',
        ),
      ),
    );
  }

  Widget _buildArtists(double width) {
    return SizedBox(
      width: width,
      child: Text(
        _artistNames,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.white60,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildMetadata() {
    return Text(
      "$_formattedType • $_formattedYear",
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
