import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String _answer = '0';
  var _userInput = '';
  var _convertTo = ['Imperial to Metric', 'Metric to Imperial'];
  var _convertToSelected = 'Imperial to Metric';
  var convertFrom = ['Height', 'Temperature', 'Weight'];
  var _convertFromSelected = 'Height';
  var _currentConvertion = '';
  var _currentScale = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Number',
                ),
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    _userInput = text;
                  } else {
                    setState(() {
                      _answer = '0';
                    });
                  }
                }),
            DropdownButton<String>(
              items: convertFrom.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                setState(() {
                  _convertFromSelected = newValueSelected;
                  if(newValueSelected=='Weight'){
                    _currentScale = 'Weight';
                  }else if(newValueSelected=='Height'){
                    _currentScale = 'Height';
                  }else{
                    _currentScale = 'Temperature';
                  }
                });
              },
              value: _convertFromSelected,
            ),
            DropdownButton<String>(
              items: _convertTo.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (newValueSelected) {
                setState(() {
                  _convertToSelected = newValueSelected;
                  if (newValueSelected == 'Imperial to Metric') {
                    _currentConvertion = 'Imperial to Metric';
                  } else {
                    _currentConvertion = 'Metric to Imperial';
                  }
                });
              },
              value: _convertToSelected,
            ),
            RaisedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                setState(() {
                  _answer = calculate(_currentScale, _currentConvertion, _userInput);
                });
              },
              child: Text('Convert'),
              color: Colors.blue,
            ),
            Text(
              _answer,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


String calculate(String currentScale, String currentConvertion, String _userInput) {
  String _answer = '';
  // if (_currentConvertToSelected == 'Imperial to Metric') {
  if (currentConvertion == 'Imperial to Metric') {
    switch (currentScale) {
      case 'Weight':
        _answer =
            (double.parse(_userInput) * 0.4536).toStringAsFixed(2) + " kg";

        break;
      case 'Height':
        _answer = (double.parse(_userInput) * 0.3048).toStringAsFixed(2) + " m";

        break;

      case 'Temperature':
        _answer =
            (((double.parse(_userInput) - 32) * 5) / 9).toStringAsFixed(2) +
                " C";

        break;
    }
  } else {
    switch (currentScale) {
      case 'Weight':
        _answer =
            (double.parse(_userInput) * 2.2046).toStringAsFixed(2) + " lbs";

        break;
      case 'Height':
        _answer =
            (double.parse(_userInput) * 3.2808).toStringAsFixed(2) + " ft";

        break;

      case 'Temperature':
        _answer =
            (((double.parse(_userInput) / 5) * 9) + 32).toStringAsFixed(2) +
                " F";

        break;
    }
  }
  return _answer;
}
