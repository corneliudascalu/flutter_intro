class GoogleBook {
  final String id;
  final String title;
  final String author;
  final String date;
  final String description;
  final String thumbnail;
  final String link;

  GoogleBook(this.id, this.title, author, this.date, String description,
      String thumbnail, this.link)
      : this.description = description != null? description: "[No description]",
        this.author = author != null ? author : "[No author]",
        this.thumbnail = thumbnail != null ? thumbnail : "";
}
