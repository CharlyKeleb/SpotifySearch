import 'package:flutter/cupertino.dart';
import 'package:spotify/model/album_model.dart';
import 'package:spotify/model/artist_model.dart';
import 'package:spotify/model/enum.dart';
import 'package:spotify/services/search_services.dart';

class SearchViewModel extends ChangeNotifier {
  List searchTypes = ['Album', 'Artist'];

  String query = '';
  String selectedType = 'Album';

  AlbumModel albums = AlbumModel();
  ArtistModel artists = ArtistModel();

  SearchService searchService = SearchService();

  ApiRequestStatus apiRequestStatus = ApiRequestStatus.loading;

  //search
  search() async {
    setApiRequestStatus(ApiRequestStatus.loading);
    var res =
        await searchService.search(query, type: selectedType.toLowerCase());
    print('RES $res');
    try {
      if (res is AlbumModel) {
        print("TOTAL COUNT ${res.albums?.total}");
        setAlbums(res);
      } else {
        setArtists(res);
        print(res.artists.items![0].name);
      }
      setApiRequestStatus(ApiRequestStatus.loaded);
    } catch (e) {
      print('======= $e');
    }
  }

  setSearchOption(val) {
    selectedType = val;
    notifyListeners();
  }

  setQuery(val) {
    query = val;
    notifyListeners();
  }

  void setApiRequestStatus(ApiRequestStatus value) {
    apiRequestStatus = value;
    notifyListeners();
  }

  void setArtists(ArtistModel value) {
    artists = value;
    notifyListeners();
  }

  void setAlbums(AlbumModel value) {
    albums = value;
    notifyListeners();
  }
}
