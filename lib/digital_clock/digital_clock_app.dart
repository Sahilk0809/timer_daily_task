import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:time_daily_task/utils/global.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();

        if(dateTime.hour>11){
          timeZone = 'PM';
        }
        else{
          timeZone = 'AM';
        }
        switch (dateTime.weekday) {
          case 1:
            day = 'Monday';
            break;
          case 2:
            day = 'Tuesday';
            break;
          case 3:
            day = 'Wednesday';
            break;
          case 4:
            day = 'Thursday';
            break;
          case 5:
            day = 'Friday';
            break;
          case 6:
            day = 'Saturday';
            break;
          case 7:
            day = 'Sunday';
        }
      });
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/bg.jpg'),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 350,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${dateTime.hour%12} : ${dateTime.minute} : ${dateTime.second} ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      timeZone,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                day,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 280,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/digital');
                      },
                      child: const Text(
                        'Digital',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/analogue');
                      },
                      child: const Text(
                        'Analogue',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/strap');
                      },
                      child: const Text(
                        'Strap',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
