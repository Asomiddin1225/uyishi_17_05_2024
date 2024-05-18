import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => SchedulePage();
}

class SchedulePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, Mangcoding'),
            Text(
              "Let's schedule your activities",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: const Icon(Icons.person),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Schedule',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.grid_view),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Let's schedule your activities",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'January 2024',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.add),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (index) => Column(
                  children: [
                    Text('SMTWTFS'[index]),
                    const SizedBox(height: 5),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor:
                          index == 4 ? Colors.blue : Colors.transparent,
                      child: Text(
                        '${16 + index}',
                        style: TextStyle(
                          color: index == 4 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FilterButton(
                    text: 'All',
                    isSelected: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilterButton(
                    text: 'New',
                    isSelected: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ScheduleItem(
                    date: 'Sun, 20/1/2023',
                    time: '10.00 AM - 01.00 PM',
                    title:
                        'Development of software for the protection of information resources',
                    urgent: true,
                  ),
                  ScheduleItem(
                    date: 'Sun, 20/1/2023',
                    time: '10.00 AM - 01.00 PM',
                    title:
                        'Development of software for the protection of information resources',
                    urgent: false,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ScheduleItem(
                    date: 'Sun, 20/1/2023',
                    time: '10.00 AM - 01.00 PM',
                    title:
                        'Development of software for the protection of information resources',
                    urgent: true,
                  ),
                  ScheduleItem(
                    date: 'Sun, 20/1/2023',
                    time: '10.00 AM - 01.00 PM',
                    title:
                        'Development of software for the protection of information resources',
                    urgent: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  FilterButton({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final String date;
  final String time;
  final String title;
  final bool urgent;

  ScheduleItem(
      {required this.date,
      required this.time,
      required this.title,
      required this.urgent});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.event),
        title: Text(date),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time),
            Text(title),
          ],
        ),
        trailing: urgent
            ? const Chip(
                label: Text(
                  'Urgent',
                  style: TextStyle(color: Colors.red),
                ),
                backgroundColor: Color.fromARGB(255, 200, 146, 142),
              )
            : null,
      ),
    );
  }
}
