import 'package:flutter/material.dart';

// Create a Form widget.
class AddGedungForm extends StatefulWidget {
  const AddGedungForm({super.key});

  @override
  AddGedungFormState createState() {
    return AddGedungFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class AddGedungFormState extends State<AddGedungForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final kodeGedungTextController = TextEditingController();
  final namaGedungTextController = TextEditingController();

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
              controller: kodeGedungTextController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter kode gedung',
                labelText: 'Kode Gedung',
              ),
            ),
            TextFormField(
              controller: namaGedungTextController,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter nama gedung',
                labelText: 'Nama Gedung',
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: ElevatedButton(
                  onPressed: (() => print(kodeGedungTextController.text +
                      namaGedungTextController.text)),
                  child: const Text('Submit'),
                )),
          ],
        ),
      ),
    );
  }
}
