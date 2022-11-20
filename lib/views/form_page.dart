import 'package:flutter/material.dart';
import 'package:my_app/views/form_gedung.dart';

import 'form_ruang.dart';

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
  final List<Widget> _forms = [const FormGedung(), const FormRuang()];

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            height: 50,
            child: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "Tambah Gedung",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Tambah Ruangan",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: _forms),
      ),
    );
  }
}
