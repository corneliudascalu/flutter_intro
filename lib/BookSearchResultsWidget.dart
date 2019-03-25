import 'package:flutter/material.dart';
import 'package:flutter_intro/Book.dart';
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
                    return ExpansionTile(
                      leading: Image.network(
                        book.iconUrl,
                        height: 48,
                        fit: BoxFit.fitWidth,
                      ),
                      title: Text(book.title),
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  book.author,
                                  textAlign: TextAlign.end,
                                  style: descriptionStyle,
                                ),
                                Text(
                                  book.description,
                                  textAlign: TextAlign.start,
                                  style: descriptionStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    MaterialButton(
                                      onPressed: () => {},
                                      child: Text("Add"),
                                    ),
                                    MaterialButton(
                                      onPressed: () => {
                                            showDialog(
                                                context: context,
                                                builder: (buildContext) {
                                                  return AlertDialog(
                                                    title: Text(book.title),
                                                    content: Table(
                                                      children: <TableRow>[
                                                        TableRow(
                                                            children: [
                                                          Text(
                                                            book.author,
                                                            style:
                                                                dialogTextStyle,
                                                          )
                                                        ]),
                                                        TableRow(children: [
                                                          Text(
                                                            book.description,
                                                            style:
                                                                dialogTextStyle,
                                                          )
                                                        ]),
                                                      ],
                                                    ),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text("Add"),
                                                        onPressed: () => {},
                                                      ),
                                                      MaterialButton(
                                                        onPressed: () => { Navigator.pop(context)},
                                                        child: Text("Cancel"),
                                                      ),
                                                    ],
                                                  );
                                                })
                                          },
                                      child: Text("Details"),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ],
                    );
                  });
          }
        });
  }
}
