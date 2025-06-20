import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../models/product_model.dart';



abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel> products;

  ProductSuccess(this.products);
}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial()) ;

  void loadProducts() {
    emit(ProductSuccess(ProductModel.list));
  }
}
