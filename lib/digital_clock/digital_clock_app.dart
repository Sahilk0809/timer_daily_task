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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              Container(
                margin: EdgeInsets.all(40),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 5, color: Colors.white,),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),

                    ...List.generate(60, (index) => Transform.rotate(
                      angle: ((index+1) * 6 * pi)/180,
                      child: ((index+1)%5==0)? const VerticalDivider(
                        endIndent: 170,
                        thickness: 1,
                      )
                      :
                      const VerticalDivider(
                        endIndent: 180,
                        thickness: 1,
                      )
                    ),),

                    Transform.rotate(
                      angle: dateTime.second * (6 * pi)/180,
                      child: const VerticalDivider(
                        thickness: 3,
                        indent: 20,
                        endIndent: 93,
                      ),
                    ),
                    Transform.rotate(
                      angle: dateTime.minute * (6 * pi)/180,
                      child: const VerticalDivider(
                        thickness: 5,
                        indent: 30,
                        endIndent: 93,
                      ),
                    ),
                    Transform.rotate(
                      angle: (dateTime.hour % 12 + dateTime.minute/60) * 30 * pi/180,
                      child: const VerticalDivider(
                        thickness: 6,
                        color: Colors.red,
                        indent: 40,
                        endIndent: 93,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
