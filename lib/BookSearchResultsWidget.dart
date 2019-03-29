import 'package:flutter/material.dart';
import 'package:flutter_intro/Book.dart';
import 'package:flutter_intro/BookListItem.dart';
import 'package:flutter_intro/BookRepository.dart';

class BookSearchResultsWidget extends StatelessWidget {
  final String query;
  final BookRepository repo;

  const BookSearchResultsWidget(
    this.query,
    this.repo, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repo.searchBook(query),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData && snapshot.data.isEmpty) {
                return Center(child: Text("No books found"));
              }
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Book book = snapshot.data[index];
                    var descriptionStyle = TextStyle(fontSize: 18);
                    var dialogTextStyle = TextStyle(
                      fontSize: 20,
                      color: Colors.brown,
                    );
                    return new BookListItem(
                        book: book,
                        descriptionStyle: descriptionStyle,
                        dialogTextStyle: dialogTextStyle);
                  });
          }
        });
  }
}
