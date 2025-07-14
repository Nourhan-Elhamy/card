import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/Category_Cubit.dart';
import '../controller/category_states.dart';

class Home extends StatelessWidget {
  final String category;
  const Home({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CategoryCubit()..fetchCategories( category),
      child: Scaffold(
        appBar: AppBar(leading: IconButton(
            onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)
        ),
          title: const Text("Categories Details"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: BlocConsumer<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              );
            } else if (state is CategoryFailure) {
              return const Center(child: Text("Failed to load data"));
            } else if (state is CategorySuccess) {
              final products = state.products;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.network(
                              product.image,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "\$${product.price}",
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          }, listener: (BuildContext context,  state) {  },
        ),
      ),
    );
  }
}