import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(24, 60, 105, 1),
          leading: Icon(Icons.home),
          titleTextStyle: TextStyle(fontSize: 25, color: Colors.white),
          title: Text('First Porfolio Exam'),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 106, 7, 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 4),
                  ),
                  child: Center(
                    child: Text(
                      'Welcome',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(50, 50, 50, 1),
                  ),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'TAMK',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(102, 102, 102, 1),
                  ),
                  child: Center(
                    child: Text(
                      'Flutter!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(153, 153, 153, 1),
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'THWS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 175,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(24, 60, 105, 1),
                    border: Border.all(
                      color: Color.fromRGBO(132, 139, 151, 1),
                      width: 3,
                    ),
                  ),
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/images/thwslogo.png"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
