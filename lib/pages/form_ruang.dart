import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/gedung.dart';
// import '../models/ruangan.dart';
import '../models/ruangan_not_hive.dart';

class FormRuang extends StatefulWidget {
  final Ruangan? updatedRuangan;

  const FormRuang({super.key, this.updatedRuangan});

  @override
  State<FormRuang> createState() => _FormRuangState();
}

class _FormRuangState extends State<FormRuang> {
  final _formKey = GlobalKey<FormState>();
  List<Gedung> _list_gedung = [];
  String _kodeRuang = "";
  String _namaRuang = "";
  int _kapasitas = 0;
  late Gedung _gedung;

  late TextEditingController kodeRuangController;
  late TextEditingController namaRuangController;
  late TextEditingController kapasitasController;

  @override
  void initState() {
    super.initState();
    _kodeRuang = widget.updatedRuangan?.kodeRuang ?? "";
    _namaRuang = widget.updatedRuangan?.namaRuang ?? "";
    _kapasitas = widget.updatedRuangan?.kapasitas ?? 0;
    _gedung = widget.updatedRuangan?.gedung ??
        Gedung(kodeGedung: "", namaGedung: "Semua Gedung");

    kodeRuangController = TextEditingController(text: _kodeRuang);
    namaRuangController = TextEditingController(text: _namaRuang);
    kapasitasController = TextEditingController(text: _kapasitas.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: kodeRuangController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter kode ruang',
                labelText: 'Kode Ruang',
              ),
              onChanged: (value) {
                setState(() {
                  _kodeRuang = value;
                });
              },
              validator: (value) {
                value = value!.trim();
                if (value == "") {
                  return "Kode ruang tidak boleh kosong";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: namaRuangController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter nama ruang',
                labelText: 'Nama Ruang',
              ),
              onChanged: (value) {
                setState(() {
                  _namaRuang = value;
                });
              },
              validator: (value) {
                value = value!.trim();
                if (value == "") {
                  return "Nama ruang tidak boleh kosong";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: kapasitasController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter kapasitas',
                labelText: 'Kapasitas',
              ),
              onChanged: (value) {
                setState(() {
                  _kapasitas = int.parse(value);
                });
              },
              validator: (value) {
                value = value!.trim();
                if (value == "" || value == '0') {
                  return "Kapasitas tidak boleh kosong";
                } else if (int.tryParse(value) == null) {
                  return "Kapasitas harus berupa angka";
                } else {
                  return null;
                }
              },
            ),
            Text("Gedung"),
            DropdownButton<Gedung>(
                items: _list_gedung.map((Gedung e) {
                  return DropdownMenuItem<Gedung>(
                      value: e, child: Text(e.namaGedung));
                }).toList(),
                onChanged: ((value) {
                  setState(() {
                    _gedung = value!;
                  });
                }),
                value: _gedung),
            Container(
                child: ElevatedButton(
              onPressed: () {
                final bool? isValid = _formKey.currentState?.validate();

                if (isValid == true) {
                  // DB Stuff here

                  _formKey.currentState?.reset();
                  kodeRuangController.text = "";
                  namaRuangController.text = "";
                  kapasitasController.text = "0";

                  if (widget.updatedRuangan != null) {
                    Navigator.pop(context);
                  }
                } else {
                  // print("Testtt");
                }
              },
              child: const Text('Submit'),
            )),
          ],
        ));
  }
}
