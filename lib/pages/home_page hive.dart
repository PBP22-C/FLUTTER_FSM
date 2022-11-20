import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/gedung.dart';
import '../models/ruangan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<Gedung> _listGedung;
  late Box<Ruangan> _listRuang;
  Gedung? _selectedGedung;

  @override
  void initState() {
    super.initState();
    // Init DB here
    _listGedung = Hive.box('gedung');
    _listRuang = Hive.box('ruangan');

    _listGedung.put(
        'ALL', Gedung(kodeGedung: "All", namaGedung: "Semua Gedung"));
    _listGedung.put(
        'Test', Gedung(kodeGedung: "Test", namaGedung: "Test Gedung"));

    _listRuang.put(
        'nah',
        Ruangan(
            kodeRuang: 'nah',
            namaRuang: 'loh',
            kapasitas: 10,
            kodeGedung: 'Test'));
    _listRuang.put(
        'loh',
        Ruangan(
            kodeRuang: "loh",
            namaRuang: "nah",
            kapasitas: 100000,
            kodeGedung: "Test"));

    _selectedGedung = _listGedung.get("ALL");
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Gedung>>(
      valueListenable: _listGedung.listenable(),
      builder: (context, Box<Gedung> box, _) {
        return Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Text("Pilih Gedung"),
              DropdownButton<Gedung>(
                value: _selectedGedung,
                items: _listGedung.values
                    .map((gedung) => DropdownMenuItem<Gedung>(
                          value: gedung,
                          child: Text(gedung.namaGedung),
                        ))
                    .toList(),
                onChanged: (Gedung? gedung) {
                  setState(() {
                    _selectedGedung = gedung;
                  });
                },
              ),
              Text("Daftar Ruangan"),
              Expanded(
                  child: ListView.builder(
                      itemCount: _listRuang.length,
                      itemBuilder: <Widget>(BuildContext context, int index) {
                        return _itemRuangan(context, index);
                      }))
            ]));
      },
    );
    // return Container(
    //   child: Column(
    // crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: <Widget>[
    //         Text("Pilih Gedung"),
    //         DropdownButton<Gedung>(
    //             items: _listGedung.map((Gedung e) {
    //               return DropdownMenuItem<Gedung>(
    //                   value: e, child: Text(e.namaGedung));
    //             }).toList(),
    //             onChanged: ((value) {
    //               setState(() {
    //                 _selectedGedung = value;
    //               });
    //             }),
    //             value: _selectedGedung),
    //         Text("Daftar Ruangan"),
    //         Expanded(
    //             child: ListView.builder(
    //                 itemCount: _listRuang.length,
    //                 itemBuilder: <Widget>(BuildContext context, int index) {
    //                   return _itemRuangan(context, index);
    //                 }))
    //       ]),
    // );
  }

  Widget _itemRuangan(BuildContext context, int i) {
    Ruangan? ruangan = _listRuang.get(i);

    return Table(children: [
      TableRow(children: [
        Text(ruangan!.namaRuang),
        Text(ruangan.kapasitas.toString())
      ]),
      TableRow(children: [Text(ruangan.kodeRuang), Text('')]),
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
