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
          Container(
            // padding 16dp
            padding: EdgeInsets.fromLTRB(16, 16, 16, 5),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
                border: Border.all(color: Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(18),
              ),
              child: TextFormField(
                controller: _kodeGedungTextController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.qr_code),
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
            ),
          ),
          Container(
            // padding 16dp
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
                border: Border.all(color: Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(18),
              ),
              child: TextFormField(
                controller: _namaGedungTextController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.apartment),
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
            ),
          ),
          Center(
            child: Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
                onPressed: onSubmit,
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
