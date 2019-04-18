import 'dart:async';

import 'package:flutter_intro/BookRepository.dart';
import 'package:flutter_intro/GoogleBook.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test_api/test_api.dart';

class MockRepo extends Mock implements BookRepository {}

class MockClient extends Mock implements Client {}

main() {
  group("blabla", () {
    test("pooop", () async {
      var repo = MockRepo();

      var list =
          List.filled(1, GoogleBook("id", "Lord", "Tolkien", "", "", "", ""));
      Future<List<GoogleBook>> future = Future.value(list);
      when(repo.searchBooksOnGoogle(any)).thenAnswer((_) => future);

      expect(await repo.searchBooksOnGoogle("blabla"), equals(list));
    });

    test("integration", () async {
      var json =
          "{\"items\":[{\"volumeInfo\":{\"id\":\"1\",\"title\":\"LOTR\",\"authors\":[\"Tolkien\"],\"publishedDate\":\"marti\",\"description\":\"blabla\",\"canonicalVolumeLink\":\"asdasd\",\"imageLinks\":{\"thumbnail\":\"\"}}}]}";
      var mockClient = MockClient();
      when(mockClient.get(any)).thenAnswer((_) async => Response(json, 200));
      var bookRepository = BookRepository(mockClient);

      expect(await bookRepository.searchBooksOnGoogle("asdfasdf"), isNotEmpty);
    });
  });
}
