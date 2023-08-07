class CategoryBook {
  final String category;
  final List<Book> items;

  CategoryBook({required this.category, required this.items});
}

class Book {
  final String? title;
  final String? des;
  final double? price;
  final String? image;

  Book({this.title, this.des, this.price, this.image});
}
