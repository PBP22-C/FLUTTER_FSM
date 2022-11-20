import 'package:flutter/material.dart';

// Create a Form widget.
class FormAddRuang extends StatefulWidget {
  const FormAddRuang({super.key});

  @override
  FormAddRuangState createState() {
    return FormAddRuangState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class FormAddRuangState extends State<FormAddRuang> {
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
                hintText: 'Enter kode ruang',
                labelText: 'Kode Ruang',
              ),
            ),
            TextFormField(
              // controller: namaGedungTextController,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter nama ruang',
                labelText: 'Nama Ruang',
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
