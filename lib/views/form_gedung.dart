import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/controllers/controllers.dart';
import 'package:my_app/models/gedung.dart';

class FormGedung extends StatefulWidget {
  const FormGedung({super.key});

  @override
  FormGedungState createState() {
    return FormGedungState();
  }
}

class FormGedungState extends State<FormGedung> {
  final _formKey = GlobalKey<FormState>();

  final _kodeGedungTextController = TextEditingController();
  final _namaGedungTextController = TextEditingController();
  final _gedungController = GedungController(Hive.box('gedung'));

  @override
  void dispose() {
    _kodeGedungTextController.dispose();
    _namaGedungTextController.dispose();
    super.dispose();
  }

  void onSubmit() async {
    try {
      if (_formKey.currentState!.validate()) {
        await _gedungController.addGedung(
          Gedung(
            kodeGedung: _kodeGedungTextController.text,
            namaGedung: _namaGedungTextController.text,
          ),
        );
        _kodeGedungTextController.clear();
        _namaGedungTextController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Gedung berhasil ditambahkan"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _kodeGedungTextController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter kode gedung',
              labelText: 'Kode Gedung',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kode gedung tidak boleh kosong';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _namaGedungTextController,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Enter nama gedung',
              labelText: 'Nama Gedung',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama gedung tidak boleh kosong';
              }
              return null;
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 150.0, top: 40.0),
            child: ElevatedButton(
              onPressed: onSubmit,
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
