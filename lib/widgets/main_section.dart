import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_providers.dart';

class MainSection extends StatefulWidget {
  @override
  _MainSectionState createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      hintText: 'Enter Amount in Euro'),
                ),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    // print('hello monitor');
                    print(textController.text);
                    setState(() {});
                  },
                  child: Text('Convert'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 4,
            color: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
          Data(
            value: textController.text,
          ),
        ],
      ),
    );
  }
}

class Data extends StatefulWidget {
  final String value;

  const Data({Key key, @required this.value}) : super(key: key);

  //List<Data> loadedData = [];
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    final loadedData = Provider.of<DataProvider>(context).items;
    return Container(
      height: 500.0,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              children: [
                Text(
                  '${loadedData[index].name} :${double.parse(loadedData[index].value) * int.parse('2')}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          );
        },
        itemCount: loadedData.length,
      ),
    );
  }
}
