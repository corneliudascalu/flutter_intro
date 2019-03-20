import 'dart:async';
import 'dart:convert';

import 'package:flutter_intro/Book.dart';
import 'package:flutter_intro/GoogleBook.dart';
import 'package:http/http.dart';

class BookRepository {
  final String searchUrl =
      "https://www.googleapis.com/books/v1/volumes?maxResults=40&q=";
  final Client client;

  BookRepository(this.client);

  Future<List<Book>> searchBook(String query) async {
    var response = await client.get(searchUrl + query);
    var body = response.body;
    var results = jsonDecode(body);
    List<dynamic> items = results["items"];
    List<Book> bookList = List();
    for (var item in items) {
      final info = item["volumeInfo"];
      if (info != null) {
        GoogleBook bookInfo = GoogleBook(
            item["id"],
            info["title"],
            info["authors"] != null ? info["authors"][0] : "[No Authors]",
            info["publishedDate"],
            info["description"],
            info["imageLinks"]["thumbnail"],
            info["canonicalVolumeLink"]);
        bookList.add(Book(
            id: bookInfo.id,
            title: bookInfo.title,
            description: bookInfo.description,
            author: bookInfo.author,
            iconUrl: bookInfo.thumbnail));
      }
    }
    return bookList;
  }
}
