import 'package:flutter/material.dart';

import 'package:flutter_weather_api_app/src/constants.dart' as constant;

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
                    // Divider(
                    //   color: Colors.grey,
                    // )
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
