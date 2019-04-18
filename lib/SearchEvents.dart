abstract class SearchEvent {}

class QueryChanged implements SearchEvent {
  final String query;

  QueryChanged(this.query);
}

class QueryDeleted implements SearchEvent {}
