import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/pages/add_gedung_form.dart';
import 'package:my_app/pages/form_page.dart';

import 'package:my_app/pages/home_page.dart';
// import 'package:my_app/pages/home_page hive.dart';

import 'package:my_app/models/gedung.dart';
import 'package:my_app/models/ruangan.dart';

// part 'main.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // register adapter
  Hive.registerAdapter<Gedung>(GedungAdapter());
  await Hive.openBox<Gedung>('gedung');

  // Hive.registerAdapter<Ruangan>(RuanganAdapter());
  // await Hive.openBox<Ruangan>('ruangan');

  runApp(AppFSM());
}

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
    const HomePage(),
    const FormPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Flutter FSM';
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: _pages.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Form")
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green,
            onTap: ((value) => setState(() {
                  _selectedIndex = value;
                })),
          ),
        ));
  }
}
