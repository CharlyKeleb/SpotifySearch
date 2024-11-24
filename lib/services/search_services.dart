import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/model/album_model.dart';
import 'package:spotify/model/artist_model.dart';
import 'package:spotify/services/auth_service.dart';
import 'package:spotify/theme/theme_config.dart';

class SearchService {
  final AuthService _authService = AuthService();

  Future<dynamic> search(String query, {String type = 'artist'}) async {
    final String? accessToken = await _authService.getAccessToken();
    if (accessToken == null) {
      _showToast('Access token is not available');
      return null;
    }

    final String url = 'https://api.spotify.com/v1/search?q=$query&type=$type';

    try {
      final response = await _sendRequest(url, accessToken);
      if (response == null) return null;

      return _parseResponse(response, type);
    } catch (e) {
      _showToast('Loading..');
      return null;
    }
  }

  // Helper to send the HTTP request
  Future<http.Response?> _sendRequest(String url, String accessToken) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  // Helper to parse the response data
  dynamic _parseResponse(http.Response response, String type) {
    final data = json.decode(response.body);

    switch (type) {
      case 'artist':
        return _parseArtist(data);
      case 'album':
        return _parseAlbum(data);
      default:
        _showToast('Unsupported search type');
        return null;
    }
  }

  // Parse Artist data
  ArtistModel? _parseArtist(Map<String, dynamic> data) {
    final artistModel = ArtistModel.fromJson(data);
    print('Artists Found: ${artistModel.artists?.total}');
    return artistModel;
  }

  // Parse Album data
  AlbumModel? _parseAlbum(Map<String, dynamic> data) {
    if (data['albums'] != null) {
      final albumModel = AlbumModel.fromJson(data);
      print('Albums Found: ${albumModel.albums?.total}');
      return albumModel;
    } else {
      _showToast('No albums found for your query');
      return null;
    }
  }

  // Helper function to show toast
  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: ThemeConfig.darkAccent,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
