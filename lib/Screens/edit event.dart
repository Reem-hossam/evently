import 'package:flutter/material.dart';

class EditEventScreen extends StatefulWidget {
  static const String routeName="EditEventScreen";
  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  TextEditingController titleController = TextEditingController(text: "Reading Book Club");
  TextEditingController descriptionController = TextEditingController(text: "Lorem ipsum dolor sit...");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Event')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/book_club.png', height: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16),
                SizedBox(width: 5),
                Text('30 November 2024 - 11:22PM'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 5),
                Text('Cairo, Egypt'),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // هتضيف هنا كود التحديث في Firebase أو Local DB
              },
              child: Text('Update Event'),
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
