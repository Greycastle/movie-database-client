library movie_database_client;

import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieDatabaseClient {
  final String apiKey;

  final String _rootUrl = 'http://www.omdbapi.com/';

  MovieDatabaseClient(this.apiKey);

  Future<List<TitleMatch>> search(String query) async {
    final url = _getUrl(query);

    final response = await http.get(url);
    final json = JsonDecoder().convert(response.body);

    final List<dynamic> results = json['Search'];
    return results.map((item) => _mapItem(item)).toList();
  }

  String _getUrl(String query) {
    final encodedQuery = Uri.encodeQueryComponent(query);
    return "$_rootUrl?apikey=$apiKey&s=$encodedQuery";
  }

  TitleMatch _mapItem(item) {
    return TitleMatch(item['Title'], item['Type'], item['Poster']);
  }
}

class TitleMatch {
  final String title;
  final String type;
  final String imageUrl;

  TitleMatch(this.title, this.type, this.imageUrl);

  @override
  bool operator ==(dynamic other) {
    if (other == null) {
      return false;
    }

    return other is TitleMatch &&
        this.title == other.title &&
        this.imageUrl == other.imageUrl &&
        this.type == other.type;
  }

  @override
  int get hashCode => super.hashCode;
}
