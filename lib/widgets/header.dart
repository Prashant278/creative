import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 0.0,
      ),
      color: Colors.blue,
      height: 70.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Euro',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                // 'Last Update ${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                'Last Update ${DateFormat('dd/MM/yyyy kk:mm').format(DateTime.now())}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: RaisedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('Refresh'),
            ),
          )
        ],
      ),
    );
  }
}
