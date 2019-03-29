import 'package:flutter/material.dart';
import 'package:flutter_intro/Book.dart';

class BookDetailsDialog extends StatelessWidget {
  const BookDetailsDialog({
    Key key,
    @required this.book,
    @required this.dialogTextStyle,
  }) : super(key: key);

  final Book book;
  final TextStyle dialogTextStyle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(book.title),
      content: Table(
        children: <TableRow>[
          TableRow(children: [
            Text(
              book.author,
              style: dialogTextStyle,
            )
          ]),
          TableRow(children: [
            Text(
              book.description,
              style: dialogTextStyle,
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
          onPressed: () => {Navigator.pop(context)},
          child: Text("Cancel"),
        ),
      ],
    );
  }
}
