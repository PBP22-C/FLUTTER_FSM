import 'package:flutter/material.dart';
import '../models/gedung.dart';
// import '../models/ruangan.dart';
import '../models/ruangan_not_hive.dart';

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
