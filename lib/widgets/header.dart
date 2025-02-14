import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather_services.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/models/weather_api.dart';
import 'package:weatherapp/icons/icons.dart';

class Header extends StatefulWidget {
  Header(
      {super.key,
      required this.backgroundColor,
      required this.city_name,
      required this.description,
      required this.descriptionIMG,
      required this.state_name,
      required this.temp});

  String city_name;
  String state_name; 
  double temp;
  String descriptionIMG;
  String description;
  Color backgroundColor;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  WeatherService weatherService = WeatherService();
  
  bool _isLoading = false;

  loadingFunc() async {
    await weatherService.getWeatherData(city);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.height / 3,
      backgroundColor: widget.backgroundColor,
      title: Padding(
        padding: const EdgeInsets.only(top: 25),
        child:  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.temp.toString() + '°',
                              style: const TextStyle(
                                  fontSize: 60, fontWeight: FontWeight.w200, color: Color.fromARGB(139, 255, 255, 255)),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.city_name,
                              style: TextStyle(fontSize: 25, color: Color.fromARGB(139, 255, 255, 255)),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.state_name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300, color: Color.fromARGB(139, 255, 255, 255)
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          width: 120,
                          height: 150,
                          child: Column(
                            children: [
                              Lottie.network(widget.descriptionIMG.toString(),
                                  fit: BoxFit.cover),
                              Text(
                                widget.description,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
        ),
      );
  }
}