import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/views/views.dart';
import 'package:my_app/models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init Hive
  await Hive.initFlutter();

  // register adapter
  Hive.registerAdapter<Gedung>(GedungAdapter());
  Hive.registerAdapter<Ruangan>(RuanganAdapter());

  // open box
  await Hive.openBox<Gedung>('gedung');
  await Hive.openBox<Ruangan>('ruangan');

  runApp(const AppFSM());
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
    const appTitle = 'Flutter FSM';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Form")
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: (value) => setState(
            () {
              _selectedIndex = value;
            },
          ),
        ),
      ),
    );
  }
}
