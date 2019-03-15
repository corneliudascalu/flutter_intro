import 'dart:async';
import 'dart:math';

import 'package:flutter_intro/Book.dart';

class BookRepository {

  Future<List<Book>> searchBook(String query) async {
    await Future.delayed(Duration(seconds: 2));

    if(query.contains("javascript")) {
      throw Exception("We don't like your kind around here");
    }

    if(query.contains("none")) {
      return List();
    }


    var book = Book(
        title: "Lord of the Rings",
        author: "Tolkien",
        description: "This is a long description",
        iconUrl: "https://placekitten.com/300/300");
    List<Book> list = List(40);
    for (int i = 0; i < 40; i++) {
      list[i] = book;
    }

    return list;
  }
}
