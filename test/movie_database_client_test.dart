import 'package:movie_database_client/movie_database_client.dart';
import 'package:movie_database_client/title_match.dart';

import 'package:test/test.dart';

import 'test_settings.dart';

void main() {

  MovieDatabaseClient client;

  TitleMatch matchingTitle;
  List<TitleMatch> allMatches;

  const searchTitle = 'The Princess Bride';

  setUp(() async {
    final apiKey = loadApiKey();
    client = new MovieDatabaseClient(apiKey);

    allMatches = await client.search(searchTitle);
    matchingTitle = allMatches.firstWhere((element) => element.title == searchTitle);
  });

  test('includes matching title', () {
    expect(matchingTitle, isNotNull);
    expect(matchingTitle.title, searchTitle);
  });

  test('includes image url', () {
    expect(matchingTitle.imageUrl, endsWith('.jpg'));
  });

  test('includes type', () {
    expect(matchingTitle.type, 'movie');
  });

  test('list of responses', () {
    expect(allMatches.length, greaterThanOrEqualTo(1));
  });
}
