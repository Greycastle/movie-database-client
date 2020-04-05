# Movie Database Client

Dart client wrapping http://www.omdbapi.com/ to search movies.

## Getting Started

To run or use this package you'll need to first get an API key from [http://omdbapi.com](http://www.omdbapi.com/apikey.aspx).

Then you can call the API like this:

```dart
final client = new MovieDatabaseClient('your key');
const results = await client.search('some title');
```

## Running tests

![Dart CI](https://github.com/Greycastle/movie-database-client/workflows/Dart%20CI/badge.svg)

The tests require having an API key to use as well.

Copy the `test/settings.example.json` to `test/settings.json` and update the key in their with your own key. 