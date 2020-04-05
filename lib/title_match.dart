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
