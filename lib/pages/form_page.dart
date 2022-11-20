import 'package:flutter/material.dart';
import 'package:my_app/pages/form_add_gedung.dart';
import 'package:my_app/pages/form_add_ruang.dart';

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
  final List<Widget> _forms = [FormAddGedung(), FormAddRuang()];

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Tambah Gedung",
                ),
                Tab(
                  text: "Tambah Ruangan",
                )
              ],
            ),
          ),
          body: TabBarView(children: _forms),
        ));
  }
}
