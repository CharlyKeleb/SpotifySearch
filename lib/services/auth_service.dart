import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/utils/client_keys.dart';
import 'package:spotify/utils/endpoints.dart';

class AuthService {
  static const _tokenKey = 'spotify_access_token';
  static const _expiryKey = 'spotify_token_expiry';

  Future<void> authenticateSpotify() async {
    //create the Basic Authorization header
    final String authHeader =
        'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}';
    //define the request body
    final Map<String, String> body = {
      'grant_type': 'client_credentials',
    };
    // Send the POST request
    try {
      final http.Response response = await http.post(
        Uri.parse(Api.oauthEndPoint),
        headers: {
          'Authorization': authHeader,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        // Parse the response
        final Map<String, dynamic> responseData = json.decode(response.body);
        // Extract token and expiration time
        final String accessToken = responseData['access_token'];
        //3600 seconds
        final int expiresIn = responseData['expires_in'];
        final DateTime expiryTime =
            DateTime.now().add(Duration(seconds: expiresIn));

        // Save the token and expiration time to SharedPreferences
        await _saveToken(accessToken, expiryTime);

        print('Access Token: $accessToken');
        print('Token expires at: $expiryTime');
      } else {
        print(
            'Failed to get access token. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error during authentication: $e');
    }
  }

  Future<void> _saveToken(String token, DateTime expiry) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_expiryKey, expiry.toIso8601String());
  }

  //get access token or refresh if expired
  Future<String?> getAccessToken() async {
    if (await isTokenValid()) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(_tokenKey);
    } else {
      await authenticateSpotify();
      return (await isTokenValid())
          ? (await SharedPreferences.getInstance()).getString(_tokenKey)
          : null;
    }
  }

  //check if access token is valid
  Future<bool> isTokenValid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? expiryString = prefs.getString(_expiryKey);

    if (expiryString != null) {
      final DateTime expiryTime = DateTime.parse(expiryString);
      return DateTime.now().isBefore(expiryTime);
    }
    // No expiry saved means the token is not valid
    return false;
  }
}
