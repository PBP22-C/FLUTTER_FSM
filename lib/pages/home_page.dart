import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/pages/form_ruang.dart';

import '../models/gedung.dart';
// import '../models/ruangan.dart';
import '../models/ruangan_not_hive.dart';

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
      Gedung(kodeGedung: "", namaGedung: "Semua Gedung"),
      Gedung(kodeGedung: "Test", namaGedung: "Testing"),
    ];

    _listRuang = [
      Ruangan(
          kodeRuang: "nah",
          namaRuang: "loh",
          kapasitas: 10,
          gedung: _listGedung[1]),
      Ruangan(
          kodeRuang: "loh",
          namaRuang: "nah",
          kapasitas: 100000,
          gedung: _listGedung[1]),
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
              showModalBottomSheet(
                  context: context,
                  builder: ((context) => BottomSheet(
                        builder: (context) =>
                            FormRuang(updatedRuangan: _listRuang[i]),
                        onClosing: () {},
                      )));
            }),
            child: Text("Ubah")),
        ElevatedButton(
            onPressed: (() {
              showDialog(
                  context: context,
                  builder: (context) => _deleteAlert(_listRuang[i]));
            }),
            child: Text("Hapus"))
      ])
    ]);
  }

  Widget _deleteAlert(Ruangan deletedRuangan) {
    return AlertDialog(
      title: const Text('Hapus Data'),
      content: Text(
          "Apakah anda ingin menghapus ruangan ${deletedRuangan.kodeRuang}"),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Ya'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Tidak'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
