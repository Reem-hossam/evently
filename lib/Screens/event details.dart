import 'package:flutter/material.dart';

import '../models/task_model.dart';
import 'edit event.dart';

class EventDetailsScreen extends StatelessWidget {
  static const String routeName = "EventDetails";

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as TaskModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("Event Details",style: Theme.of(context).textTheme.titleMedium!.copyWith(color:Theme.of(context).primaryColor)),
        actions: [IconButton(onPressed: (){
          Navigator.pushNamed(
            context,
            EditEventScreen.routeName,
            arguments: task,
          );
        }, icon: Icon(Icons.edit))],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/${task.category}.png"),
            SizedBox(height: 16,),
            Text(" ${task.title}", style:Theme.of(context)
                .textTheme.titleMedium!
                .copyWith(color:Theme.of(context).primaryColor ) ,
            ),
            SizedBox(height: 16,),

            Container(
                alignment: Alignment.centerLeft,
                width: 361,
                height: 64,
                padding: EdgeInsets.all(8),
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color:Colors.blueAccent,
                    )),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_outlined,color:Colors.blueAccent ,),
                    Text(" ${DateTime.now()}"),
                  ],
                )),
            SizedBox(height: 16,),
            Container(
                alignment: Alignment.centerLeft,
                width: 361,
                height: 64,
                padding: EdgeInsets.all(8),
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color:Colors.blueAccent,
                    )),
                child: Row(
                  children: [
                    Icon(Icons.gps_fixed_rounded,color:Colors.blueAccent ,),
                    Text("Cairo , Egypt"),
                  ],
                )),
            SizedBox(height: 16,),
            Container(
              alignment: Alignment.centerLeft,
              width: 361,
              height:150,
              padding: EdgeInsets.all(8),
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color:Colors.blueAccent,
                  )),
            ),
            SizedBox(height: 20),

            Text("Description:\n ${task.description}"),
            SizedBox(height: 16,),


          ],
        ),
      ),
    );
  }
}
