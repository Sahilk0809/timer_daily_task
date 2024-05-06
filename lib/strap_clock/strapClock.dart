import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_daily_task/utils/global.dart';

class StrapClock extends StatefulWidget {
  const StrapClock({super.key});

  @override
  State<StrapClock> createState() => _StrapClockState();
}

class _StrapClockState extends State<StrapClock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();

        if (dateTime.hour > 11) {
          timeZone = 'PM';
        } else {
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
              image: AssetImage('assets/strapBg.jpg'),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 280,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 220,
                    width: 220,
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                      value: dateTime.second / 60,
                    ),
                  ),
                  SizedBox(
                    height: 210,
                    width: 210,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      value: dateTime.minute / 60,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      value: ((dateTime.hour % 12 + dateTime.minute / 60) / 12),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        day,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${dateTime.hour % 12} : ${dateTime.minute} : ${dateTime.second}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8, left: 2),
                            child: Text(
                              timeZone,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 230,
              ),
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
