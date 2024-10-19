import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              height:  MediaQuery.of(context).size.height / 4.5,
              //width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: const Color(0xFF2e2158),
                borderRadius: BorderRadius.circular(22),
                border: const Border.symmetric(
                    horizontal: BorderSide(color: Color(0xFF9084ca))
                  ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.grain, color: Colors.grey, size: 20,),
                        Text('air quality'.toUpperCase(), style: const TextStyle(color: Colors.grey),),
                        
                      ],
                    ),
                   
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('3-Low Health Risk',
                          style: TextStyle(
                            fontFamily: 'Poppins-Bold',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 26
                          ),),
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF3858b1),
                                Color(0xFFe147a4)
                              ]),
                          ),
                          child:CustomPaint(
                            painter: _SliderIndicatorPainter(0.0),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                          children: [
                            Container(
                              height: 0.5,
                              width: MediaQuery.of(context).size.width * 0.85,
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
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('See more',
                        style: TextStyle(
                          fontFamily: 'Poppins-Bold',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20
                        )),
                        FaIcon(
                          FontAwesomeIcons.chevronRight, 
                          color: Color.fromARGB(223, 164, 153, 192),
                          ),
                        
                      ],
                    )
                    
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height:  MediaQuery.of(context).size.height / 4.5,
                    width:  MediaQuery.of(context).size.height / 9,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2e2158),
                      borderRadius: BorderRadius.circular(22),
                      border: const Border.symmetric(
                          horizontal: BorderSide(color: Color(0xFF9084ca))
                        ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const FaIcon(FontAwesomeIcons.sun),
                            Text('uv index'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.grey
                            ),)
                          ],
                        ),
                        const Text('4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26
                        ),),
                        const Text('Moderate',
                         style: TextStyle(
                          color: Colors.white,
                          fontSize: 26
                        ),
                        )
                      ],
                    ),
                  )
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                  child: Container(
                    height:  MediaQuery.of(context).size.height / 4.5,
                    width:  MediaQuery.of(context).size.height / 9,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2e2158),
                      borderRadius: BorderRadius.circular(22),
                      border: const Border.symmetric(
                          horizontal: BorderSide(color: Color(0xFF9084ca))
                        ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const FaIcon(FontAwesomeIcons.sun),
                            Text('uv index'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.grey
                            ),)
                          ],
                        ),
                        const Text('4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26
                        ),),
                        const Text('Moderate',
                         style: TextStyle(
                          color: Colors.white,
                          fontSize: 26
                        ),
                        )
                      ],
                    ),
                  )
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _SliderIndicatorPainter extends CustomPainter {
  final double position;
  _SliderIndicatorPainter(this.position);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(
          position, 
          size.height / 2
          ), 4, Paint()..color = Colors.white);
  }
@override
  bool shouldRepaint(_SliderIndicatorPainter old) {
    return true;
  }
}