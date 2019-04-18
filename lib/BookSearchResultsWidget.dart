import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/SearchBloc.dart';
import 'package:flutter_intro/SearchEvents.dart';
import 'package:flutter_intro/SearchState.dart';

class BookSearchResultsWidget extends StatelessWidget {
  final String query;
  final SearchBloc bloc;

  const BookSearchResultsWidget(
    this.query,
    this.bloc, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchEvent, SearchState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is NoResultsState) {
          return Center(child: Text("No Results"));
        } else if (state is BooksFoundState) {
          return Center(child: Text(state.books[0].title));
        } else if (state is SearchProgressState) {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
//    return FutureBuilder(
//        future: repo.searchBook(query),
//        builder: (context, snapshot) {
//          switch (snapshot.connectionState) {
//            case ConnectionState.waiting:
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            default:
//              if (snapshot.hasError) {
//                return Center(child: Text(snapshot.error.toString()));
//              } else if (snapshot.hasData && snapshot.data.isEmpty) {
//                return Center(child: Text("No books found"));
//              }
//              return ListView.builder(
//                  itemCount: snapshot.data.length,
//                  itemBuilder: (context, index) {
//                    Book book = snapshot.data[index];
//                    return BookListItemWidget(book: book);
//                  });
//          }
//        });
  }
}
