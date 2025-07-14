import 'package:bloc/bloc.dart';

import '../data/repo/repo_data.dart';
import 'category_states.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void fetchCategories(String category) async {
    emit(CategoryLoading());

    try {
      final categories = await CategoryData().getData(category);
      emit(CategorySuccess(categories));
    } catch (e) {
      emit(CategoryFailure());
    }
  }
}