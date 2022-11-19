import 'package:flutter/material.dart';
import 'package:my_app/pages/add_gedung_form.dart';

// Create a Form widget.
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  FormPageState createState() {
    return FormPageState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class FormPageState extends State<FormPage> {
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
