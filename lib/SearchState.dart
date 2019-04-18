import 'package:flutter_intro/Book.dart';

abstract class SearchState {}

class NoResultsState implements SearchState {}

class BooksFoundState implements SearchState {
  final List<Book> books;

  BooksFoundState(this.books);
}

class SearchProgressState implements SearchState {}
