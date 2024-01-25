import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: ColoredBox(
                color: Colors.greenAccent,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TextButton(onPressed: () {}, child: Text('Button 1')),
                    TextButton(onPressed: () {}, child: Text('Button 2')),
                    TextButton(onPressed: () {}, child: Text('Button 3')),
                    TextButton(onPressed: () {}, child: Text('Button 4')),
                    TextButton(onPressed: () {}, child: Text('Button 5')),
                    TextButton(onPressed: () {}, child: Text('Button 6')),
                    TextButton(onPressed: () {}, child: Text('Button 7')),
                    TextButton(onPressed: () {}, child: Text('Button 8')),
                  ],
                )),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
