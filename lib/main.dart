import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/BookRepository.dart';
import 'package:flutter_intro/BookSearchResultsWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Book search'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search for books by title",
              onPressed: () {
                showSearch(
                    context: context, delegate: BookSearch("Book Search"));
              }),
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16, top: 16),
          child: Text("Hello, World!"),
        ));
  }
}

class BookSearch extends SearchDelegate<String> {
  final String searchHint;

  BookSearch(this.searchHint);

  @override
  List<Widget> buildActions(BuildContext context) {
    List<Widget> list = List(1);
    list[0] = IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        });
    return list;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return new BookSearchResultsWidget(query, BookRepository());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Searching for $query..."));
  }
}
