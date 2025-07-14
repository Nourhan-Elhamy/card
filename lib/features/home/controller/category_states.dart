
import '../data/models/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> products;

  CategorySuccess(this.products);
}
class CategoryFailure extends CategoryState {

}
