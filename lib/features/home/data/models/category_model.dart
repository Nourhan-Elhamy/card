
class CategoryModel {
  final int id;
  final String desc;
  final String category;
  final String title;
  final String image;
  final double price;

  CategoryModel({
    required this.id,
    required this.image,
    required this.price,
    required this.title,
    required this.desc,
    required this.category,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(
      id: data['id'],
      image: data['image'],
      price: data['price'].toDouble(),
      title: data['title'],
      desc: data['description'],
      category: data['category'],
    );
  }
}