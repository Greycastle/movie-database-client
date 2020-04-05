import 'dart:convert';
import 'dart:io';

String loadApiKey() {
  String folder = Directory.current.path.endsWith('test') ? '.' : './test';
  final file = File('$folder/settings.json');
  if (!file.existsSync()) {
    throw new SettingsFileMissing(file.path);
  }

  final contents = file.readAsStringSync();
  final json = JsonDecoder().convert(contents);
  return json['apiKey'];
}

class SettingsFileMissing extends Error {
  final String _expectedPath;

  SettingsFileMissing(this._expectedPath);

  @override
  String toString() {
    return "Could not find settings file: $_expectedPath";
  }
}