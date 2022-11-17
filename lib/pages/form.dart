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

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: AddGedungForm(
        key: _formKey,
      ),
    );
  }
}
