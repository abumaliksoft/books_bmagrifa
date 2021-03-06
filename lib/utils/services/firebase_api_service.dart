// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:bmagrifa_books/modules/books/entities/book_entity.dart';
import 'package:bmagrifa_books/modules/books/models/book.dart';
import 'package:bmagrifa_books/modules/books/repositories/books_repository.dart';

class FirebaseApiService implements BooksRepository {
  final CollectionReference booksCollection = FirebaseFirestore.instance.collection('books');

  @override
  Stream<List<Book>> getBooks() {
    return booksCollection.snapshots().map((QuerySnapshot snapshot) {
      return snapshot.docs
          .map((QueryDocumentSnapshot doc) =>
              Book.fromEntity(BookEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
