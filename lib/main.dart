import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _total = 0;
  int _screen = 2;
  String _message = 'Start counting...';

  void _add(int i){

    int tot = _total += i;

    setState(() {
      if (tot == 0) {
        _message = 'Start counting...';
        _total = 0;
      } else if (tot < 0) {
        _message = 'Can not count bellow zero...';
        _total = 0;
      } else if (tot > 9999){
        _message = 'You went too far...';
        _total = 9999;
      } else {
        _total = tot;
        _message = 'Continue counting...';
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    if (MediaQuery.of(context).orientation == Orientation.portrait){
      setState(() {
              _screen = 2;
            });
    } else {
      setState(() {
              _screen = 1;
            });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 15.0 * _screen, 0.0, 15.0 * _screen),
              child: Text(
                'Total: $_total',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(7.5 * _screen),
                  child: TextButton(
                    child: Text(
                      '+1',
                      style: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      _add(1);
                    }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7.5 * _screen),
                  child: TextButton(
                    child: Text(
                      '-1',
                      style: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      _add(-1);
                    }
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 15.0 * _screen, 0.0, 15.0 * _screen),
              child: Text(
                '$_message',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}