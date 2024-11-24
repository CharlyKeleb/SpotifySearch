class AlbumModel {
  Albums? albums;

  AlbumModel({this.albums});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    albums =
    json['albums'] != null ? Albums.fromJson(json['albums']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (albums != null) {
      data['albums'] = albums!.toJson();
    }
    return data;
  }
}

class Albums {
  String? href;
  int? limit;
  String? next;
  int? offset;
  dynamic? previous;
  int? total;
  List<AlbumItem>? items;

  Albums(
      {this.href,
        this.limit,
        this.next,
        this.offset,
        this.previous,
        this.total,
        this.items});

  Albums.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
    if (json['items'] != null) {
      items = <AlbumItem>[];
      json['items'].forEach((v) {
        items!.add(AlbumItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['limit'] = limit;
    data['next'] = next;
    data['offset'] = offset;
    data['previous'] = previous;
    data['total'] = total;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AlbumItem {
  String? albumType;
  int? totalTracks;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  String? type;
  String? uri;
  List<Artists>? artists;

  AlbumItem(
      {this.albumType,
        this.totalTracks,
        this.availableMarkets,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.name,
        this.releaseDate,
        this.releaseDatePrecision,
        this.type,
        this.uri,
        this.artists});

  AlbumItem.fromJson(Map<String, dynamic> json) {
    albumType = json['album_type'];
    totalTracks = json['total_tracks'];
    availableMarkets = json['available_markets'].cast<String>();
    externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    name = json['name'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    type = json['type'];
    uri = json['uri'];
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(Artists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['album_type'] = albumType;
    data['total_tracks'] = totalTracks;
    data['available_markets'] = availableMarkets;
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    data['href'] = href;
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['release_date'] = releaseDate;
    data['release_date_precision'] = releaseDatePrecision;
    data['type'] = type;
    data['uri'] = uri;
    if (artists != null) {
      data['artists'] = artists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spotify'] = spotify;
    return data;
  }
}

class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

  Images.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}

class Artists {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artists(
      {this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

  Artists.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    data['href'] = href;
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['uri'] = uri;
    return data;
  }
}
