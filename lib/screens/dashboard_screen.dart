import 'package:flutter/material.dart';
import 'package:flutter_weather_api_app/widgets/weather_forecast_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      appBar: AppBar(),
      body: const Center(
        child: WeatherForecastWidget()
        // MultiCircularSlider(
        //   progressBarType: MultiCircularSliderType.circular,
        //   size: MediaQuery.of(context).size.width * 0.6,
        //   values: const [0.2, 0.1, 0.3, 0.4],
        //   colors: const [Color(0xFFFD1960), Color(0xFF29D3E8), Color(0xFF18C737), Color(0xFFFFCC05)],

        // ),
      ),
    );
  }
}