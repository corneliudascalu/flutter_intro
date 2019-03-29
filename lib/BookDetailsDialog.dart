import 'package:flutter/material.dart';
import 'package:flutter_intro/Book.dart';

class BookDetailsWidget extends StatelessWidget {
  const BookDetailsWidget({
    Key key,
    this.book,
    this.dialogTextStyle,
  }) : super(key: key);

  final Book book;
  final TextStyle dialogTextStyle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(book.title),
      content: Container(
        constraints: BoxConstraints.loose(Size(double.maxFinite, 200)),
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text(
              book.author,
              style: dialogTextStyle,
            ),
            Text(
              book.description,
              style: dialogTextStyle,
            )
          ],
        ),
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
