import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_api_app/screens/home_screen.dart';
import 'package:flutter_weather_api_app/screens/sign_up_screen.dart';
import 'package:flutter_weather_api_app/utils/validators.dart';
import 'package:flutter_weather_api_app/widgets/custom_text_form_field_widget.dart';
import 'package:flutter_weather_api_app/widgets/parallax/layer.dart';
import 'package:flutter_weather_api_app/widgets/parallax/parallax_sensor_bg.dart';
import 'package:flutter_weather_api_app/widgets/parallax/parallax_sensors.dart';

import 'package:flutter_weather_api_app/src/constants.dart' as constants;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);

        if (userCredential.user != null) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeScreen()));
        }
      } on FirebaseAuthException {
        rethrow;
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Failed to Login")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ParallaxSensorBg(
      sensor: ParallaxSensor.gyroscope,
      layers: [
        Layer(
          sensitivity: 1,
          image: const AssetImage('assets/images/bg_galaxy.jpg'),
          preventCrop: true,
          //opacity: 0.7
        ),
        Layer(
            sensitivity: 7,
            image: const AssetImage('assets/images/nebula.png'),
            imageHeight: MediaQuery.of(context).size.height,
            imageWidth: MediaQuery.of(context).size.width,
            preventCrop: true,
            opacity: 0.4),
        Layer(
            sensitivity: 10,
            image: const AssetImage('assets/images/stars.png'),
            preventCrop: true,
            opacity: 0.2),
        Layer(
          sensitivity: 3,
          image: const AssetImage('assets/images/weather_n.png'),
          preventCrop: true,
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 26, right: 26),
        child: ListView(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          color: constants.solidLightPurple,
                          fontSize: 46,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormFieldWidget(
                      controller: _emailController,
                      label: 'Email',
                      validator: (val) =>
                          Validators.emailValidation(val),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormFieldWidget(
                            controller: _passwordController,
                            label: 'Password',
                            validator: (val) =>
                                Validators.passwordValidation(
                                    val),
                          ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFa9bcfe),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(221, 32, 31, 47)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: const Offset(
                                50, 50), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 50,
                          decoration: BoxDecoration(
                            color: constants.solidPurple,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              _login();
                            },
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: constants.solidLightPurple,
                                    fontFamily: 'Poppins',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => const SignUpScreen()));
                        },
                        buttonText: 'Don\'t have an account? Register',
                        buttonTextColor: constants.solidLightPurple,
                        )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
