import 'package:flutter/material.dart';

import 'edit event.dart';

class EventDetailsScreen extends StatelessWidget {
  static const String  routeName="EventDetailsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/sport.png', height: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              'We Are Going To Play Football',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16),
                SizedBox(width: 5),
                Text('21 November 2024 - 12:12PM'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 5),
                Text('Cairo, Egypt'),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
              style: TextStyle(fontSize: 14),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, EditEventScreen.routeName);
              },
              child: Text('Edit Event'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
