import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const RecipeHome(title: 'Recipe Calculator'),
    );
  }
}

class RecipeHome extends StatefulWidget {
  const RecipeHome({super.key, required this.title});

  final String title;

  @override
  State<RecipeHome> createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {
  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      // 2
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // 3
      body: SafeArea(
        // 4
        child: ListView.builder(
          // 5
          itemCount: Recipe.samples.length,
          // 6
          itemBuilder: (BuildContext context, int index) {
            Widget buildRecipeCard(Recipe recipe) {
              return Card(
                // 1
                elevation: 2.0,
                // 2
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                // 3
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // 4
                  child: Column(
                    children: <Widget>[
                      Image(image: AssetImage(recipe.imageUrl)),
                      // 5
                      const SizedBox(
                        height: 14.0,
                      ),
                      // 6
                      Text(
                        recipe.label,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Palatino',
                        ),
                      )
                    ],
                  ),
                ),
              );
            }

            // 7
            return GestureDetector(
              // 8
              onTap: () {
                // 9
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 10
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    },
                  ),
                );
              },
              // 11
              child: buildRecipeCard(Recipe.samples[index]),
            );
          }, // itemBuilder
        ),
      ),
    );
  }
}
