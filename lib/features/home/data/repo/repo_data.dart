import 'package:card/main.dart';
import 'package:dio/dio.dart';

import '../models/category_model.dart';
class CategoryData{

  Future <List<CategoryModel>> getData(String category)async{

    final Dio dio =Dio();

    final response =await dio.get("https://fakestoreapi.com/products/category/$category");

    List<dynamic> data = response.data;

    return data.map((item) => CategoryModel.fromJson(item)).toList();

  }


}
