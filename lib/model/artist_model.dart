class ArtistModel {
  Artists? artists;

  ArtistModel({this.artists});

  ArtistModel.fromJson(Map<String, dynamic> json) {
    artists =
        json['artists'] != null ? Artists.fromJson(json['artists']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (artists != null) {
      data['artists'] = artists!.toJson();
    }
    return data;
  }
}

class Artists {
  String? href;
  int? limit;
  String? next;
  int? offset;
  Null? previous;
  int? total;
  List<ArtistItems>? items;

  Artists(
      {this.href,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total,
      this.items});

  Artists.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
    if (json['items'] != null) {
      items = <ArtistItems>[];
      json['items'].forEach((v) {
        items!.add(ArtistItems.fromJson(v));
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

class ArtistItems {
  ExternalUrls? externalUrls;
  Followers? followers;
  List<String>? genres;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  int? popularity;
  String? type;
  String? uri;

  ArtistItems(
      {this.externalUrls,
      this.followers,
      this.genres,
      this.href,
      this.id,
      this.images,
      this.name,
      this.popularity,
      this.type,
      this.uri});

  ArtistItems.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    followers = json['followers'] != null
        ? Followers.fromJson(json['followers'])
        : null;
    genres = json['genres'].cast<String>();
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    name = json['name'];
    popularity = json['popularity'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    if (followers != null) {
      data['followers'] = followers!.toJson();
    }
    data['genres'] = genres;
    data['href'] = href;
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['popularity'] = popularity;
    data['type'] = type;
    data['uri'] = uri;
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

class Followers {
  Null? href;
  int? total;

  Followers({this.href, this.total});

  Followers.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['total'] = total;
    return data;
  }
}

class Images {
  String? url;
  int? height;
  int? width;

  Images({this.url, this.height, this.width});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}
