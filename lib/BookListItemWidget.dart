import 'package:flutter/material.dart';
import 'package:flutter_intro/Book.dart';
import 'package:flutter_intro/BookDescriptionWidget.dart';

class BookListItemWidget extends StatelessWidget {
  final Book book;
  final TextStyle descriptionStyle = const TextStyle(fontSize: 18);

  const BookListItemWidget({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (buildContext) {
                              return new BookDescriptionWidget(book: book);
                            });
                      },
                      child: Text("Details"),
                    )
                  ],
                )
              ],
            )),
      ],
    );
  }
}
