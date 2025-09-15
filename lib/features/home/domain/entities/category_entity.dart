class CategoryEntity {
  final int id;
  final String title;
  final int courses_count;
  final int low_price;
  final int high_price;

  CategoryEntity({
    required this.id,
    required this.title,
    required this.courses_count,
    required this.low_price,
    required this.high_price,
  });
}
