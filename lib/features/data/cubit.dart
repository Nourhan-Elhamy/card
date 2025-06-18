import 'package:bloc/bloc.dart';

import '../models/product_model.dart';



abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  ProductLoaded(this.products);
}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial()) ;

  void loadProducts() {
    emit(ProductLoaded(ProductModel.list));
  }
}
