class Book {
  Book({required this.title});

  Book.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String,
        );

  final String title;

  Map<String, Object?> toJson() {
    return {
      'title': title,
    };
  }
}
