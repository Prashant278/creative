import 'package:RX/providers/data_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print('hello');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<DataProvider>(context).fetchAndSetData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Header(),
            MainSection(),
          ],
        ),
      ),
    );
  }
}
