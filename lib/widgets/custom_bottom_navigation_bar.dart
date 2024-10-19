import 'package:flutter/material.dart';
import 'package:flutter_weather_api_app/screens/dashboard_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.isActiveTab,
  });

  final bool isActiveTab;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}