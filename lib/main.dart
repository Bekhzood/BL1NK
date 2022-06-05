import 'package:bl1ink_app/screens/home_page/spealist_list.dart';
import 'package:bl1ink_app/widgets/categories_list_view.dart';
import 'package:bl1ink_app/widgets/drawables/drawables.dart';
import 'package:bl1ink_app/widgets/search_container.dart';
import 'package:bl1ink_app/widgets/stylist_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Find your master', style: const TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Expanded(
                        child: Text('Welcome back, Shokhrukh', style: TextStyle(fontSize: 18))
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: const Center(
                        child: Icon(Icons.notifications, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const SearchContainer(text: 'Find your master ...'),
              const SizedBox(height: 16.0),
              const CategoriesListView(),
              const SizedBox(height: 16.0),
              SpecialistListView()
            ],
          ),
        ),
      ),
    );
  }
}
