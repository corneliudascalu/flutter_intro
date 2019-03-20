class GoogleBook {
  final String id;
  final String title;
  final String author;
  final String date;
  String description;
  final String thumbnail;
  final String link;

  GoogleBook(this.id, this.title, this.author, this.date, String description,
      this.thumbnail, this.link) {
    this.description = description != null ? description : "[No description]";
  }
}
