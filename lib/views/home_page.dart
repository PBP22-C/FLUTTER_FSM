import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/controllers/controllers.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/views/form_ruang.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GedungController _gedungController =
      GedungController(Hive.box('gedung'));
  final RuanganController _ruanganController =
      RuanganController(Hive.box('ruangan'));
  List<Gedung> _gedungList = [];
  List<Ruangan> _ruanganList = [];
  Gedung? _selectedGedung;

  @override
  void initState() {
    super.initState();
    // Default value
    _gedungList = _gedungController.getAllGedung();
    _gedungList.insert(
        0, const Gedung(kodeGedung: '', namaGedung: 'Semua Gedung'));
    _selectedGedung = _gedungList.first;
    _ruanganList = _ruanganController.getAllRuangan();
  }

  void _onGedungChanged(Gedung? value) {
    setState(() {
      _selectedGedung = value;
      if (_selectedGedung?.kodeGedung != "") {
        _ruanganList = _ruanganController.getRuanganByGedung(value!);
      } else {
        _ruanganList = _ruanganController.getAllRuangan();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Gedung>>(
      valueListenable: _gedungController.box.listenable(),
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text("Pilih Gedung"),
          DropdownButton<Gedung>(
            value: _selectedGedung,
            items: _gedungList
                .map(
                  (gedung) => DropdownMenuItem<Gedung>(
                    value: gedung,
                    child: Text(gedung.namaGedung),
                  ),
                )
                .toList(),
            onChanged: _onGedungChanged,
          ),
          const Text("Daftar Ruangan"),
          Expanded(
            child: ListView.builder(
              itemCount: _ruanganList.length,
              itemBuilder: <Widget>(BuildContext context, int index) {
                return _itemRuangan(context, index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _itemRuangan(BuildContext context, int i) {
    Ruangan ruangan = _ruanganList[i];
    return Table(
      children: [
        TableRow(children: [
          Text(ruangan.namaRuang),
          Text(ruangan.kapasitas.toString())
        ]),
        TableRow(children: [Text(ruangan.kodeRuang), const Text('')]),
        TableRow(
          children: [
            ElevatedButton(
                onPressed: (() async {
                  final result = await showModalBottomSheet(
                    context: context,
                    builder: (context) => FormRuang(updatedRuangan: ruangan),
                  );
                  if (result != null) {
                    setState(() {
                      _ruanganList = _ruanganController
                          .getRuanganByGedung(_selectedGedung!);
                    });
                  }
                }),
                child: const Text("Ubah")),
            ElevatedButton(
              onPressed: (() {
                showDialog(
                  context: context,
                  builder: (context) => _deleteAlert(ruangan),
                );
              }),
              child: const Text("Hapus"),
            )
          ],
        )
      ],
    );
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
            _ruanganController.deleteRuangan(deletedRuangan.kodeRuang);
            setState(() {
              _ruanganList =
                  _ruanganController.getRuanganByGedung(_selectedGedung!);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "Ruangan ${deletedRuangan.kodeRuang} berhasil dihapus"),
              ),
            );
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
