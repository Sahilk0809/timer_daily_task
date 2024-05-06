import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/global.dart';

class AnalogueClock extends StatefulWidget {
  const AnalogueClock({super.key});

  @override
  State<AnalogueClock> createState() => _AnalogueClockState();
}

class _AnalogueClockState extends State<AnalogueClock> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          dateTime = DateTime.now();
        });
      });
    });
    return SafeArea(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/anabg.jpg'),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 260,
            ),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: Colors.white),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                  ...List.generate(
                    60,
                    (index) => Transform.rotate(
                        angle: ((index + 1) * 6 * pi) / 180,
                        child: ((index + 1) % 5 == 0)
                            ? const VerticalDivider(
                                color: Colors.red,
                                endIndent: 220,
                                thickness: 1.5,
                              )
                            : const VerticalDivider(
                                endIndent: 230,
                                thickness: 1,
                              )),
                  ),
                  Transform.rotate(
                    angle: (dateTime.hour % 12 + dateTime.minute / 60) *
                        30 *
                        pi /
                        180,
                    child: const VerticalDivider(
                      thickness: 4.5,
                      color: Colors.red,
                      indent: 55,
                      endIndent: 110,
                    ),
                  ),
                  Transform.rotate(
                    angle: dateTime.minute * (6 * pi) / 180,
                    child: const VerticalDivider(
                      thickness: 3.5,
                      color: Colors.yellow,
                      indent: 45,
                      endIndent: 110,
                    ),
                  ),
                  Transform.rotate(
                    angle: dateTime.second * (6 * pi) / 180,
                    child: const VerticalDivider(
                      thickness: 2.5,
                      indent: 30,
                      endIndent: 110,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 220,
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
    ));
  }
}
