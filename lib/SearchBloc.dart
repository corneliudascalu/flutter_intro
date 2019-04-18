import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_intro/Book.dart';
import 'package:flutter_intro/SearchEvents.dart';
import 'package:flutter_intro/SearchState.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => SearchProgressState();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is QueryChanged) {
      await Future.delayed(Duration(seconds: 2));
      var books = List<Book>();
      books.add(Book(id: "bla", author: "Tolkien", title: "Lord of the rings"));

      yield BooksFoundState(books);
      await Future.delayed(Duration(seconds: 1));
      yield BooksFoundState(skdjfhsdkfjsdhf);

    } else if (event is QueryDeleted) {
      yield NoResultsState();
    }
  }
}
