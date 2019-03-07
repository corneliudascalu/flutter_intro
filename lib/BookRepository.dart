import 'package:flutter_intro/Book.dart';

class BookRepository {
  Future<List<Book>> searchBook(String query) async {
    await Future.delayed(Duration(seconds: 2));
    if (query.contains("ios")) {
      throw BookSearchException("We don't like your kind around here");
    }
    var book = Book(
        author: "Ion Creangă",
        title: "Capra cu trei iezi",
        description: "Story of my life",
        iconUrl: "https://placekitten.com/200/300");
    List<Book> books = List.from([
      book,
      book,
      book,
      book,
      book,
      book,
      book,
      book,
      book,
      book,
      book,
      book,
      book,
      book
    ]);
    return books;
  }
}

class BookSearchException implements Exception {
  final String message;

  BookSearchException(this.message);
}
