class TestWeatherModel {
  final String time;
  final String icon;
  final String percentage;
  final String temperature;

  TestWeatherModel(this.time, this.icon, this.percentage, this.temperature);
}

  // List of parameters for weather model
  final List<TestWeatherModel> weatherModel = [
    TestWeatherModel('12 AM', 'assets/images/mid_rain_moon.png', '30%', '19°'),
    TestWeatherModel('Now', 'assets/images/mid_rain_moon.png', '', '19°'),
    TestWeatherModel('2 AM', 'assets/images/mid_rain_moon.png', '', '18°'),
    TestWeatherModel('3 AM', 'assets/images/mid_rain_moon.png', '', '19°'),
    TestWeatherModel('4 AM', 'assets/images/mid_rain_moon.png', '', '19°'),
    TestWeatherModel('5 AM', 'assets/images/mid_rain_moon.png', '', '19°'),
    TestWeatherModel('6 AM', 'assets/images/mid_rain_moon.png', '', '20°'),
    TestWeatherModel('7 AM', 'assets/images/mid_rain_moon.png', '', '20°')
  ];
