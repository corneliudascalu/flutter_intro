import 'package:flutter/material.dart';
import 'package:flutter_intro/Book.dart';
import 'package:flutter_intro/BookComplexDescriptionWidget.dart';

class BookDescriptionWidget extends StatelessWidget {
  const BookDescriptionWidget({
    Key key,
    this.book,
  }) : super(key: key);

  final Book book;
  final TextStyle dialogTextStyle = const TextStyle(
    fontSize: 20,
    color: Colors.brown,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(book.title),
      content: new BookComplexDescriptionWidget(book: book),
//      content: Table(
//        children: <TableRow>[
//          TableRow(children: [
//            Text(
//              book.author,
//              style: dialogTextStyle,
//            )
//          ]),
//          TableRow(children: [
//            Text(
//              book.description,
//              style: dialogTextStyle,
//            )
//          ]),
//        ],
//      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Add"),
          onPressed: () => {},
        ),
        MaterialButton(
          onPressed: () => {Navigator.pop(context)},
          child: Text("Cancel"),
        ),
      ],
    );
  }
}
