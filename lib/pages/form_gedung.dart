import 'package:flutter/material.dart';

// Create a Form widget.
class FormGedung extends StatefulWidget {
  const FormGedung({super.key});

  @override
  FormGedungState createState() {
    return FormGedungState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class FormGedungState extends State<FormGedung> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  String _kodeGedung = "";
  String _namaGedung = "";

  TextEditingController kodeGedungController =
      TextEditingController(text: _kodeGedung);

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
              controller: kodeGedungController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter kode gedung',
                labelText: 'Kode Gedung',
              ),
              onChanged: (value) {
                _kodeGedung = value;
              },
              validator: (value) {
                value = value!.trim();
                if (value == "") {
                  return "Kode gedung tidak boleh kosong";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: namaGedungController,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter nama gedung',
                labelText: 'Nama Gedung',
              ),
              onChanged: (value) {
                _namaGedung = value;
              },
              validator: (value) {
                value = value!.trim();
                if (value == "") {
                  return "Nama gedung tidak boleh kosong";
                } else {
                  return null;
                }
              },
            ),
            Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: ElevatedButton(
                  onPressed: (() {
                    final bool? isValid = _formKey.currentState?.validate();

                    if (isValid == true) {
                      // DB Stuff here

                      _formKey.currentState?.reset();
                      kodeGedungController.text = "";
                      namaGedungController.text = "";
                    } else {
                      // print("Testtt");
                    }
                  }),
                  child: const Text('Submit'),
                )),
          ],
        ),
      ),
    );
  }
}
