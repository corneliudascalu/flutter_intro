import 'package:flutter/material.dart';
import 'package:flutter_intro/Book.dart';

class BookComplexDescriptionWidget extends StatelessWidget {
  const BookComplexDescriptionWidget({
    Key key,
    this.book,
  }) : super(key: key);

  final Book book;
  final TextStyle dialogTextStyle = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      constraints: BoxConstraints.loose(Size(double.maxFinite, 200)),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Text(
            "Author",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            book.author,
            style: dialogTextStyle,
          ),
          Text(
            "Description",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            book.description,
            style: dialogTextStyle,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
