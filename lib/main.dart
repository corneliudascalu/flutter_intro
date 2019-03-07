import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/Book.dart';
import 'package:flutter_intro/BookRepository.dart';

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
    return new BookSearchResultsWidget(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Searching for $query..."));
  }
}

class BookSearchResultsWidget extends StatelessWidget {
  final String query;

  const BookSearchResultsWidget(
    this.query, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (query.contains("book")) {
      var repo = BookRepository();
      //List<Book> books = repo.searchBook(query);
      return FutureBuilder<List<Book>>(
          future: repo.searchBook(query),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                  "Searching...",
                  style: TextStyle(fontSize: 24),
                ));
              default:
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var book = snapshot.data[index];
                    return ExpansionTile(
                      leading: Image.network(
                        book.iconUrl,
                        fit: BoxFit.scaleDown,
                        width: 48,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[Text(book.title), Text(book.author)],
                      ),
                      children: <Widget>[
                        Text(
                          book.description,
                        )
                      ],
                    );
                  },
                );
            }
          });
    }
    return Center(
      child: Text(
        "No books found",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
