import 'package:flutter/material.dart';
import 'package:my_app/pages/add_gedung_form.dart';
import 'package:my_app/pages/home.dart';

void main() => runApp(const AppFSM());

class AppFSM extends StatefulWidget {
  const AppFSM({super.key});

  @override
  State<AppFSM> createState() => _AppFSMState();
}

class _AppFSMState extends State<AppFSM> {
  int _selectedIndex = 0;

  // final TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _pages = [
    const Home(),
    const AddGedungForm(),
  ];

  @override
  Widget build(BuildContext context) {
    const appTitle = 'App FSM Flutter';

    void onTap(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return (MaterialApp(
        title: appTitle,
        home: (Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: _pages.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Form")
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green,
            onTap: onTap,
          ),
        ))));
  }
}
