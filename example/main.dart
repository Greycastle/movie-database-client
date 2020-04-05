import 'dart:async';

import 'package:movie_database_client/movie_database_client.dart';
import 'package:movie_database_client/title_match.dart';

Future<int> main(List<String> args) async {
  if (args.length != 2) {
    print("Usage: pub run main.dart <apiKey> <search>");
    return 1;
  }
  final apiKey = args[0];
  final search = args[1];

  final client = new MovieDatabaseClient(apiKey);
  final result = await client.search(search);

  if (result.isEmpty) {
    print("No matches.");
  } else {
    result.forEach(printMatch);
  }

  return 0;
}

void printMatch(TitleMatch match) {
  print("${match.type}: ${match.title}");
}
