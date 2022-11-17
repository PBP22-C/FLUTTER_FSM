import 'package:flutter/material.dart';
import 'package:my_app/pages/add_gedung_form.dart';

void main() => runApp(const AppFSM());

class AppFSM extends StatelessWidget {
  const AppFSM({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Flutter Form Demo';
    return MaterialApp(title: appTitle, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = [
    const AddGedungForm(),
    const Scaffold(body: Center(child: Text("Halaman")))
  ];
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Flutter Form Demo';

    void onTap(int index) {
      print(index.toString());
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: onTap,
      ),
    );
  }
}
