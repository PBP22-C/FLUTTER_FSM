import 'package:flutter/material.dart';

// Create a Form widget.
class FormAddGedung extends StatefulWidget {
  const FormAddGedung({super.key});

  @override
  FormAddGedungState createState() {
    return FormAddGedungState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class FormAddGedungState extends State<FormAddGedung> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  // Mending diganti state
  // final kodeGedungTextController = TextEditingController();
  // final namaGedungTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              // controller: kodeGedungTextController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter kode gedung',
                labelText: 'Kode Gedung',
              ),
            ),
            TextFormField(
              // controller: namaGedungTextController,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter nama gedung',
                labelText: 'Nama Gedung',
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: ElevatedButton(
                  onPressed: (() => print("HAHAHAHAHA")),
                  child: const Text('Submit'),
                )),
          ],
        ),
      ),
    );
  }
}
