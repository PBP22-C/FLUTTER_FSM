import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/gedung.dart';

// Move this somewhere else
class Ruangan {
  String kodeRuang;
  String namaRuang;
  int kapasitas;
  Gedung gedung;

  Ruangan(
      {required this.kodeRuang,
      required this.namaRuang,
      required this.kapasitas,
      required this.gedung});
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

    print(_listRuang[0].gedung);
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
                  builder: ((context) => FormUpdateRuang(
                      listGedung: _listGedung, updatedRuangan: _listRuang[i])));
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

class FormUpdateRuang extends StatefulWidget {
  final List<Gedung> listGedung;
  final Ruangan updatedRuangan;

  const FormUpdateRuang(
      {super.key, required this.listGedung, required this.updatedRuangan});

  @override
  State<FormUpdateRuang> createState() => _FormUpdateRuangState();
}

class _FormUpdateRuangState extends State<FormUpdateRuang> {
  final _formKey = GlobalKey<FormState>();
  String _kodeRuang = "";
  String _namaRuang = "";
  int _kapasitas = 0;
  late Gedung _gedung;

  @override
  void initState() {
    super.initState();
    print(widget.updatedRuangan.gedung);
    _kodeRuang = widget.updatedRuangan.kodeRuang;
    _namaRuang = widget.updatedRuangan.namaRuang;
    _kapasitas = widget.updatedRuangan.kapasitas;
    _gedung = widget.updatedRuangan.gedung;
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (context) => Form(
          key: _formKey,
          child: Column(
            children: [
              Text("Ubah Data"),
              TextFormField(
                initialValue: _kodeRuang,
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
              ),
              TextFormField(
                initialValue: _namaRuang,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter nama ruang',
                  labelText: 'Nama Ruang',
                ),
              ),
              TextFormField(
                initialValue: _kapasitas.toString(),
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter kapasitas',
                  labelText: 'Kapasitas',
                ),
              ),
              Text("Gedung"),
              DropdownButton<Gedung>(
                  items: widget.listGedung.map((Gedung e) {
                    return DropdownMenuItem<Gedung>(
                        value: e, child: Text(e.namaGedung));
                  }).toList(),
                  onChanged: ((value) {
                    setState(() {
                      _gedung = value!;
                    });
                  }),
                  value: _gedung),
            ],
          )),
      onClosing: () {
        print("Closed"); // TODO: REQUIRED
      },
      // animationController: null, // TODO: Perlu diganti biar ngga null
    );
  }
}
