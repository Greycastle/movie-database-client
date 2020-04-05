library movie_database_client;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_database_client/title_match.dart';

class MovieDatabaseClient {
  final String apiKey;

  final String _rootUrl = 'http://www.omdbapi.com/';

  MovieDatabaseClient(this.apiKey);

  Future<List<TitleMatch>> search(String query) async {
    var json = await _getSearchJson(query);
    return _parseResultJson(json);
  }

  List<TitleMatch> _parseResultJson(json) {
    final List<dynamic> results = json['Search'];
    return results.map((item) => _parseItem(item)).toList();
  }

  Future _getSearchJson(String query) async {
    final url = _getUrl(query);

    final response = await http.get(url);
    final json = JsonDecoder().convert(response.body);
    return json;
  }

  String _getUrl(String query) {
    final encodedQuery = Uri.encodeQueryComponent(query);
    return "$_rootUrl?apikey=$apiKey&s=$encodedQuery";
  }

  TitleMatch _parseItem(item) {
    return TitleMatch(item['Title'], item['Type'], item['Poster']);
  }
}
