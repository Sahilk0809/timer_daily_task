import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: BorderDirectional(bottom: BorderSide(width: 1,)),
                  ),
                  child: Text('Common Button')),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Text Button'),
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('Filled Button'),
              ),
              FilledButton.tonal(
                onPressed: () {},
                child: const Text('Filled Tonal'),
              ),
              FloatingActionButton(onPressed: () {

              },child: const Icon(Icons.add),),
            ],
          ),
        ),
      ),
    );
  }
}