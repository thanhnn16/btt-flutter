import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Appointment'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Pending', icon: Icon(Icons.pending_outlined),),
                Tab(text: 'Confirmed', icon: Icon(Icons.check_circle_outline)),
                Tab(text: 'Completed', icon: Icon(Icons.done_all)),
                Tab(text: 'Cancelled', icon: Icon(Icons.cancel_outlined)),
              ],
              labelStyle: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              Text('Pending'),
              Text('Confirmed'),
              Text('Completed'),
              Text('Cancelled'),
            ],
          ),
        ),
      ),
    );
  }
}
