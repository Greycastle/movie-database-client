# movie_database_client

Dart client to search movies

## Getting Started

To run or use this package you'll need to first get an API key from [http://omdbapi.com](http://www.omdbapi.com/apikey.aspx).

Then you can call the API like this:

```dart
final client = new MovieDatabaseClient('your key');
const results = await client.search('some title');
```
