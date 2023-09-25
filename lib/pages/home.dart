import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4b2/pages/search.dart';
import 'package:week4b2/pages/setting.dart';
import 'package:week4b2/providers/setting_provider.dart';
import 'package:week4b2/providers/weather_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter weather'),
          backgroundColor: Colors.blue,
          // leading: const Icon(Icons.settings),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Setting()),
                  );
                },
                child: const Icon(Icons.settings),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Search()),
                    );
                  },
                  child: const Icon(Icons.search)),
            ),
          ],
        ),
        body: Consumer2<WeatherProvider, SettingProvider>(
          builder: (context, weatherProvider, settingProvider, child) =>
              SafeArea(
            child: weatherProvider.weather != null
                ? RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(
                        const Duration(seconds: 4),
                        () {
                          weatherProvider.search(weatherProvider.nameCity);
                        },
                      );
                    },
                    child: Container(
                      color: const Color(0xFF0066FF),
                      padding:
                          const EdgeInsets.only(left: 50, right: 50, top: 80),
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          Text(
                            weatherProvider.weather!.city,
                            style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Update at ${weatherProvider.weather!.last_updated}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https:${weatherProvider.weather!.icon}'),
                              ),
                              Text(
                                settingProvider.isSwitch
                                    ? '${weatherProvider.weather!.temp_c}\u2103'
                                    : '${weatherProvider.weather!.temp_f}\u2109',
                                style: const TextStyle(
                                  fontSize: 34,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    settingProvider.isSwitch
                                        ? 'min ${weatherProvider.weather!.mintemp_c}\u2103'
                                        : 'min ${weatherProvider.weather!.mintemp_f}\u2109',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    settingProvider.isSwitch
                                        ? 'max ${weatherProvider.weather!.maxtemp_c}\u2103'
                                        : 'max ${weatherProvider.weather!.maxtemp_f}\u2109',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                weatherProvider.weather!.text,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
