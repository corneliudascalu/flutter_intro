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
    var googleBooks = await searchBooksOnGoogle(query);
    List<Book> bookList = List();
    for (var book in googleBooks) {
      bookList.add(Book(
          id: book.id,
          title: book.title,
          description: book.description,
          author: book.author,
          iconUrl: book.thumbnail));
    }
    return bookList;
  }

  Future<List<GoogleBook>> searchBooksOnGoogle(String query) async {
    var response = await client.get(searchUrl + query);
    var body = response.body;
    var results = jsonDecode(body);
    List<dynamic> items = results["items"];
    List<GoogleBook> list = List();
    for (var item in items) {
      final info = item["volumeInfo"];
      list.add(GoogleBook(
          item["id"],
          info["title"],
          info["authors"] != null ? info["authors"][0] : "[No Authors]",
          info["publishedDate"],
          info["description"],
          info["imageLinks"]["thumbnail"],
          info["canonicalVolumeLink"]));
    }
    return list;
  }
}
