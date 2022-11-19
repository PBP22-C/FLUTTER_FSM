import 'package:flutter/material.dart';

import '../models/gedung.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Gedung> _listGedung = [];
  Gedung? _selectedGedung;

  @override
  void initState() {
    super.initState();
    _listGedung = [
      Gedung(kodeGedung: -1, namaGedung: "Semua Gedung"),
      Gedung(kodeGedung: 1, namaGedung: "Testing"),
    ];
    _selectedGedung = _listGedung[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Column(children: [
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
              value: _selectedGedung)
        ]),
        Column(
          children: [
            Text("Daftar Ruangan"),
          ],
        )
      ]),
    );
  }
}

class ItemRuangan extends StatelessWidget {
  final Gedung ruangan;

  const ItemRuangan({super.key, required this.ruangan});

  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(children: [Text(this.ruangan.namaGedung)])
    ]);
  }
}
