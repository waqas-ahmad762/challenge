import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
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
      backgroundColor: Color.fromRGBO(253, 254, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(4, 169, 244, 1),
          ),
          onPressed: () {},
        ),
        title: Text(
          'Appointments',
          style: TextStyle(
            color: Color.fromRGBO(4, 169, 244, 1),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.calendar_view_day,
              color: Color.fromRGBO(4, 169, 244, 1),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ToggleButtons(
                borderColor: Colors.grey,
                fillColor: Color.fromRGBO(4, 169, 244, 1),
                borderWidth: 2,
                selectedBorderColor: Color.fromRGBO(4, 169, 244, 1),
                selectedColor: Colors.white,
                color: Color.fromRGBO(4, 169, 244, 1),
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
                      'Availiability',
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
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _date('Mon 13'),
                _date('Tue 14'),
                _colorDate('Wed 15'),
                _date('Thurs 16'),
                _date('Fri 17'),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            _cards('Morning', '8:00 AM - 12:00 PM'),
            SizedBox(
              height: 10,
            ),
            _cards('AfterNoon', '12:00 AM - 4:00 PM'),
            SizedBox(
              height: 10,
            ),
            _cards('Evening', '4:00 PM - 8:00 PM'),
            SizedBox(
              height: 10,
            ),
            _cards('Night', '8:00 PM - 12:00 AM'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _cards(String heading, String subheading) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: Container(
        width: double.infinity,
        child: Card(
          color: Colors.grey[100],
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 23,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subheading,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _time(
                      '8:00 AM',
                      Color.fromRGBO(4, 169, 244, 1),
                    ),
                    _time(
                      '9:00 AM',
                      Colors.grey,
                    ),
                    _time(
                      '10:00 AM',
                      Color.fromRGBO(4, 169, 244, 1),
                    ),
                    _time(
                      '11:00 AM',
                      Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _time(
                      '12:00 AM',
                      Color.fromRGBO(4, 169, 244, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _time(String time, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: color,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Text(
          time,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }

  Widget _colorDate(String date) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Color.fromRGBO(254, 236, 251, 1),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          date,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _date(String date) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          date,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
