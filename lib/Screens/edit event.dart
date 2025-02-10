import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../firebase_manager/fierbase_manager.dart';
import '../models/task_model.dart';

class EditEventScreen extends StatefulWidget {
  static const String routeName = "EditEvent";

  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TaskModel task;


  @override
  Widget build(BuildContext context) {
    task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    titleController = TextEditingController(text: task!.title);
    descriptionController = TextEditingController(text: task!.description);

    return Scaffold(
      appBar: AppBar(title: Text("Edit Event",style: Theme.of(context).textTheme.titleMedium!.copyWith(color:Theme.of(context).primaryColor))),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Image.asset(
                  "assets/images/${task.category}.png",
                  height: 225,
                ),
              ),
              Align(alignment: Alignment.topLeft,
                  child: Text("Title")),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  prefixIcon: Icon(Icons.edit_note),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Align(alignment: Alignment.topLeft,
                  child: Text("description")),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Description",
                ),
              ),
              SizedBox(
                height: 16,
              ),

              ElevatedButton(
                onPressed: () {
                  task.title = titleController.text;
                  task.description = descriptionController.text;
                  FirebaseManager.updateEvent(task);
                  Navigator.pop(context);
                },
                child: Text("Uptade Event",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 152),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}