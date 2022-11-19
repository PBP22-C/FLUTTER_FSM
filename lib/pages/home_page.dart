import 'package:flutter/material.dart';

import '../models/gedung.dart';

// Move this somewhere else
class Ruangan {
  String kodeRuang;
  String namaRuang;
  int kapasitas;

  Ruangan(
      {required this.kodeRuang,
      required this.namaRuang,
      required this.kapasitas});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Gedung> _listGedung = [];
  List<Ruangan> _listRuang = [];
  Gedung? _selectedGedung;

  @override
  void initState() {
    super.initState();
    // Init DB here
    _listGedung = [
      Gedung(kodeGedung: "All", namaGedung: "Semua Gedung"),
      Gedung(kodeGedung: "Test", namaGedung: "Testing"),
    ];

    _listRuang = [
      Ruangan(kodeRuang: "nah", namaRuang: "loh", kapasitas: 10),
      Ruangan(kodeRuang: "loh", namaRuang: "nah", kapasitas: 100000),
    ];
    _selectedGedung = _listGedung[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Pilih Gedung"),
            DropdownButton<Gedung>(
                items: _listGedung.map((Gedung e) {
                  return DropdownMenuItem<Gedung>(
                      value: e, child: Text(e.namaGedung));
                }).toList(),
                onChanged: ((value) {
                  setState(() {
                    _selectedGedung = value;
                  });
                }),
                value: _selectedGedung),
            Text("Daftar Ruangan"),
            Expanded(
                child: ListView.builder(
                    itemCount: _listRuang.length,
                    itemBuilder: <Widget>(BuildContext context, int index) {
                      return _itemRuangan(context, index);
                    }))
          ]),
    );
  }

  Widget _itemRuangan(BuildContext context, int i) {
    return Table(children: [
      TableRow(children: [
        Text(_listRuang[i].namaRuang),
        Text(_listRuang[i].kapasitas.toString())
      ]),
      TableRow(children: [Text(_listRuang[i].kodeRuang), Text('')]),
      TableRow(children: [
        ElevatedButton(
            onPressed: (() {
              print("Update!");
            }),
            child: Text("Ubah")),
        ElevatedButton(
            onPressed: (() {
              print("Delete!");
            }),
            child: Text("Hapus"))
      ])
    ]);
  }
}
