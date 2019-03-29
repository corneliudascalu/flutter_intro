import 'package:flutter/material.dart';
import 'package:flutter_intro/Book.dart';
import 'package:flutter_intro/BookDetailsDialog.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({
    Key key,
    @required this.book,
    @required this.descriptionStyle,
    @required this.dialogTextStyle,
  }) : super(key: key);

  final Book book;
  final TextStyle descriptionStyle;
  final TextStyle dialogTextStyle;

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
                        if (book.author.length > 10) {
                          showDialog(
                              context: context,
                              builder: (buildContext) {
                                return new BookDetailsWidget(
                                    book: book,
                                    dialogTextStyle: dialogTextStyle);
                              });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDetailsWidget(
                                        book: book,
                                        dialogTextStyle: dialogTextStyle,
                                      )));
                        }
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
