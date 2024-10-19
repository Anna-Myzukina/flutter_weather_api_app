import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_api_app/models/test_weather_model.dart';
import 'package:flutter_weather_api_app/screens/profile_screen.dart';

import 'package:flutter_weather_api_app/src/constants.dart' as constant;
import 'package:flutter_weather_api_app/widgets/custom_app_bar_widget.dart';
import 'package:flutter_weather_api_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter_weather_api_app/widgets/multi_colour_circular_indicator/custom_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isForecastVisible = false;
  bool isActiveTab = true;
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width, 
          100.0
        ), 
      child: CustomAppBarWidget(auth: _auth)
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill)),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // Country name
                    // weather.name
                    'Montreal',
                    style: TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontFamily: 'Poppins-Bold',
                        height: 1.2),
                  ),
                  Text('19°',
                      style: TextStyle(
                          fontSize: 86,
                          color: Colors.white,
                          fontFamily: 'Poppins-Bold',
                          height: 0.8)),
                  Text('Mostly Clear',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontFamily: 'Poppins-Bold',
                          height: 1.1)),
                  Text('H:24°   L:18°',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Poppins-Bold',
                      )),
                ],
              ),
              Image(image: AssetImage('assets/images/house.png')),
            ],
          ),
          //WeatherBottomSheet(),
          CustomBottomSheet(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/ellipse2.png'))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                isForecastVisible != isForecastVisible;
                              },
                              child: const Image(
                                  height: 5,
                                  width: 48,
                                  image: AssetImage('assets/images/shape.png')),
                            )
                          ],
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Hourly Forecast',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('Weekly Forecast',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 2.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color.fromARGB(191, 59, 62, 95),
                              Color.fromARGB(207, 144, 132, 202),
                              Color.fromARGB(197, 113, 98, 186),
                              Color.fromARGB(210, 84, 63, 132)
                            ])),
                          )
                        ],
                      ),
                      WeatherListViewWidget(),
                      const SizedBox(
                        height: 8,
                      ),
                      //const WeatherForecastWidget()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(isActiveTab: isActiveTab),
    );
  }
}


class WeatherListViewWidget extends StatelessWidget {
  const WeatherListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 148,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weatherModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 148,
                      width: 60,
                      decoration: BoxDecoration(
                          gradient: constant.purple,
                          borderRadius:
                              BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 8),
                        child: Column(
                          children: [
                            Text(
                              weatherModel[index].temperature,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13),
                            ),
                            Image(
                                height: 38,
                                width: 44,
                                image: AssetImage(
                                    weatherModel[index]
                                        .icon)),
                            Text(
                              weatherModel[index].percentage,
                              style: const TextStyle(
                                  color: constant.lightBlue),
                            ),
                            Text(
                              weatherModel[index].temperature,
                              style: const TextStyle(
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

