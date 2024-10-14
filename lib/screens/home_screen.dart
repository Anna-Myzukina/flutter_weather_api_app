import 'package:flutter/material.dart';
import 'package:flutter_weather_api_app/models/weather_model.dart';
import 'package:flutter_weather_api_app/screens/dashboard_screen.dart';

import 'package:flutter_weather_api_app/src/constants.dart' as constant;
import 'package:flutter_weather_api_app/widgets/multi_colour_circular_indicator/custom_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final List<WeatherModel> weatherModel = [
    WeatherModel('12 AM', 'assets/images/mid_rain_moon.png', '30%', '19°'),
    WeatherModel('Now', 'assets/images/mid_rain_moon.png', '', '19°'),
    WeatherModel('2 AM', 'assets/images/mid_rain_moon.png', '', '18°'),
    WeatherModel('3 AM', 'assets/images/mid_rain_moon.png', '', '19°'),
    WeatherModel('4 AM', 'assets/images/mid_rain_moon.png', '', '19°'),
    WeatherModel('5 AM', 'assets/images/mid_rain_moon.png', '', '19°'),
    WeatherModel('6 AM', 'assets/images/mid_rain_moon.png', '', '20°'),
    WeatherModel('7 AM', 'assets/images/mid_rain_moon.png', '', '20°')
  ];

  bool isActiveTab = true;
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              height: 5,
                              width: 48,
                              image: AssetImage('assets/images/shape.png'))
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
                      SizedBox(
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
                                    borderRadius: BorderRadius.circular(40)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
                                  child: Column(
                                    children: [
                                      Text(
                                        weatherModel[index].temperature,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                      Image(
                                          height: 38,
                                          width: 44,
                                          image: AssetImage(
                                              weatherModel[index].icon)),
                                      Text(
                                        weatherModel[index].percentage,
                                        style: const TextStyle(color: constant.lightBlue),
                                      ),
                                      Text(
                                        weatherModel[index].temperature,
                                        style: const TextStyle(color: Colors.white),
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
                      ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/rectangle.png')),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DashboardScreen()));
              },
              child: Image(
                  image: AssetImage(isActiveTab
                      ? 'assets/images/locationOff.png'
                      : 'assets/images/locationOn.png')),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const Image(
                    height: 100,
                    image: AssetImage('assets/images/subtract.png')),
                Image(
                    height: 84,
                    image: AssetImage(isActiveTab
                        ? 'assets/images/buttonPlusDefault.png'
                        : 'assets/images/buttonPlusVariant2.png'))
              ],
            ),
            Image(
                image: AssetImage(isActiveTab
                    ? 'assets/images/listIcon.png'
                    : 'assets/images/menuIcon.png'))
          ],
        ),
      ),
    );
  }
}



/// First version of weather widget, later will be updated using ListView.builder
/// For now the parameters is static, after willbe come from WeatherModel
/// after from weather API according to location

class WeatherBottomSheet extends StatelessWidget {
  const WeatherBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: constant.darkPurple,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0))),
            child: Column(
              children: [
                const Row(
                  children: [
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
                const Row(
                  children: [Text('Hourly Forecast'), Text('Weekly Forecast')],
                ),
                const Divider(
                  color: Colors.grey,
                ),
              
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            gradient: constant.purple,
                            borderRadius: BorderRadius.circular(40)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 8),
                          child: Column(
                            children: [
                              Text(
                                '12 AM',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                              Image(
                                  height: 38,
                                  width: 44,
                                  image: AssetImage(
                                      'assets/images/mid_rain_moon.png')),
                              Text(
                                '30%',
                                style: TextStyle(color: constant.lightBlue),
                              ),
                              Text(
                                '19',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            '12 AM',
                            style: TextStyle(color: Colors.white),
                          ),
                          Image(
                              height: 38,
                              width: 44,
                              image: AssetImage(
                                  'assets/images/mid_rain_moon.png')),
                          Text(
                            '30%',
                            style: TextStyle(color: constant.lightBlue),
                          ),
                          Text(
                            '19',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            '12 AM',
                            style: TextStyle(color: Colors.white),
                          ),
                          Image(
                              height: 38,
                              width: 44,
                              image: AssetImage(
                                  'assets/images/mid_rain_moon.png')),
                          Text(
                            '30%',
                            style: TextStyle(color: constant.lightBlue),
                          ),
                          Text(
                            '19',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            '12 AM',
                            style: TextStyle(color: Colors.white),
                          ),
                          Image(
                              height: 38,
                              width: 44,
                              image: AssetImage(
                                  'assets/images/mid_rain_moon.png')),
                          Text(
                            '30%',
                            style: TextStyle(color: constant.lightBlue),
                          ),
                          Text(
                            '19',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            '12 AM',
                            style: TextStyle(color: Colors.white),
                          ),
                          Image(
                              height: 38,
                              width: 44,
                              image: AssetImage(
                                  'assets/images/mid_rain_moon.png')),
                          Text(
                            '30%',
                            style: TextStyle(color: constant.lightBlue),
                          ),
                          Text(
                            '19',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            '12 AM',
                            style: TextStyle(color: Colors.white),
                          ),
                          Image(
                              height: 38,
                              width: 44,
                              image: AssetImage(
                                  'assets/images/mid_rain_moon.png')),
                          Text(
                            '30%',
                            style: TextStyle(color: constant.lightBlue),
                          ),
                          Text(
                            '19',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            '12 AM',
                            style: TextStyle(color: Colors.white),
                          ),
                          Image(
                              height: 38,
                              width: 44,
                              image: AssetImage(
                                  'assets/images/mid_rain_moon.png')),
                          Text(
                            '30%',
                            style: TextStyle(color: constant.lightBlue),
                          ),
                          Text(
                            '19',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.add)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
