import 'package:card/features/home/widgets/product_card.dart';
import 'package:card/features/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ProductCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProductCubit();
    cubit.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          centerTitle: true,
        ),
        body: BlocConsumer<ProductCubit, ProductState>(
          listener: (BuildContext context, state) {
            if(state is ProductLoaded){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));

            }
          },
          builder: (context, state) {
            if (state is ProductLoaded) {
              final list = state.products;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (_, index) =>
                      ProductCard(productModel: list[index]),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
