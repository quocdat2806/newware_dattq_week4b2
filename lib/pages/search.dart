import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4b2/providers/weather_provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('City'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Search city',
            suffixIcon: Consumer<WeatherProvider>(
              builder: (context, weatherProvider, child) => InkWell(
                onTap: () {
                  weatherProvider.search(controller.text);
                },
                child: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
