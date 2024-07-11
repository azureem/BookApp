class BookUiData {
  final String id;
  final String title;
  final String author;
  final String category;
  final String audio;
  final String doc;
  final String? img;

  BookUiData({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.audio,
    required this.doc,
    required this.img,
  }) {}

  //   factory BookUiData.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
  //   return BookUiData(
  //     id: snapshot.id,
  //     title: snapshot.get('title'),
  //     author: snapshot.get('author'),
  //     category: snapshot.get('category'),
  //     description: snapshot.get('description'),
  //     audio: snapshot.get('audio'),
  //     doc: snapshot.get('doc'),
  //     img: snapshot.get('img'),
  //   );
  // }
  factory BookUiData.fromFireStore(Map<String, dynamic> data, docId) {
    return BookUiData(
      id: docId,
      audio: data['audio'] ?? '',
      author: data['author'] ?? '',
      category: data['category'] ?? '',
      doc: data['doc'] ?? '',
      img: data['img'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
