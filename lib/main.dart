import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/models/gedung.dart';

part 'main.g.dart';

void main() async {
  await Hive.initFlutter();
  // register adapter
  Hive.registerAdapter<Gedung>(GedungAdapter());
  await Hive.openBox<Gedung>('gedung');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Box<Gedung> listGedung;

  @override
  void initState() {
    super.initState();
    listGedung = Hive.box('gedung');
    listGedung.put('gedung1', Gedung(kodeGedung: '123', namaGedung: 'gedung1'));
  }

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Flutter Form Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: ValueListenableBuilder(
          valueListenable: listGedung.listenable(),
          builder: (context, Box<Gedung> box, _) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, listIndex) {
                return Column(
                  children: [
                    Text(box.getAt(listIndex)?.kodeGedung.toString() ?? ''),
                    Text(box.getAt(listIndex)?.namaGedung ?? ''),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
            ),
          ),
          new Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: new ElevatedButton(
                child: const Text('Submit'),
                onPressed: null,
              )),
        ],
      ),
    );
  }
}
