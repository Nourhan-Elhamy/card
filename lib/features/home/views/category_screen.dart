
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detsils.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
final List<String> categories =[
  "electronics",
  "jewelery",
  "men's%20clothing",
  "women's%20clothing"
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body:ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: Text(
                      category,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Home(category:category),
                        ),
                      );
                    },
                  );
                },
              )




    );
  }
}
