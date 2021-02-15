import 'package:challenge/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code Challenge',
      home: UserTabScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isSelected;
  var _dataToDisplay;
  int _value = 1;
  @override
  void initState() {
    _dataToDisplay = ['TTest1', 'TTest2', 'TTest3'];
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.lightBlueAccent,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Appointments',
          style: TextStyle(
            color: Colors.lightBlueAccent,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.calendar_view_day,
              color: Colors.lightBlueAccent,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: ToggleButtons(
              borderColor: Colors.grey,
              fillColor: Colors.blueAccent,
              borderWidth: 2,
              selectedBorderColor: Colors.blueAccent,
              selectedColor: Colors.white,
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(25),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Appointments',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Availibilty',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                });
              },
              isSelected: isSelected,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _value = 1;
                  });
                },
                child: Text(
                  'Upcoming Appointments',
                  style: TextStyle(
                    fontSize: 18,
                    color: _value == 1 ? Colors.grey : Colors.blueAccent,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _value = 2;
                  });
                },
                child: Text(
                  'Past Appointments',
                  style: TextStyle(
                    fontSize: 18,
                    color: _value == 2 ? Colors.grey : Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Today, 15 Feb 2021',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _dataToDisplay.length,
              itemBuilder: (context, index) {
                return _card();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _card() {
    return Card(
      elevation: 0.5,
      color: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          top: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  color: _value == 1 ? Colors.orange : Colors.blueAccent,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '18',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Jan',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr.Chuii Kinw',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Category Category',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Complaints',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Descripation Descripation',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '8:30 - 10:30',
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Divider(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.ac_unit,
                  color: Colors.lightBlue,
                ),
                Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                ),
                Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
