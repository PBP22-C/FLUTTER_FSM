import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:my_app/controllers/controllers.dart';
import 'package:my_app/models/models.dart';

class FormRuang extends StatefulWidget {
  final Ruangan? updatedRuangan;

  const FormRuang({super.key, this.updatedRuangan});

  @override
  State<FormRuang> createState() => _FormRuangState();
}

class _FormRuangState extends State<FormRuang> {
  final _formKey = GlobalKey<FormState>();
  final GedungController _gedungController =
      GedungController(Hive.box('gedung'));

  final TextEditingController _kodeRuangController = TextEditingController();
  final TextEditingController _namaRuangController = TextEditingController();
  final TextEditingController _kapasitasController = TextEditingController();
  late Gedung? _gedung;
  final RuanganController _ruanganController =
      RuanganController(Hive.box('ruangan'));
  List<Gedung> _gedungList = [];

  @override
  void initState() {
    super.initState();
    _kodeRuangController.text = widget.updatedRuangan?.kodeRuang ?? "";
    _namaRuangController.text = widget.updatedRuangan?.namaRuang ?? "";
    _kapasitasController.text =
        widget.updatedRuangan?.kapasitas.toString() ?? '';

    _gedungList = _gedungController.getAllGedung();
    _gedungList.removeWhere((element) => element.kodeGedung == 'All');
    if (widget.updatedRuangan?.gedung != null) {
      _gedung = _gedungList
          .where((element) =>
              element.kodeGedung == widget.updatedRuangan?.gedung.kodeGedung)
          .first;
    } else {
      _gedung = null;
    }
  }

  void onSubmit() async {
    try {
      if (_gedung == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Gedung tidak boleh kosong"),
          ),
        );
        return;
      }
      if (_formKey.currentState!.validate()) {
        Ruangan ruangan = Ruangan(
          kodeRuang: _kodeRuangController.text,
          namaRuang: _namaRuangController.text,
          kapasitas: int.parse(_kapasitasController.text),
          gedung: _gedung!,
        );
        if (widget.updatedRuangan == null) {
          await _ruanganController.addRuangan(ruangan);
        } else {
          await _ruanganController.updateRuangan(
            ruangan,
            widget.updatedRuangan!.kodeRuang,
          );
        }
        _kodeRuangController.clear();
        _namaRuangController.clear();
        _kapasitasController.clear();
        if (widget.updatedRuangan != null) {
          Navigator.pop(context, true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Berhasil mengedit ruangan"),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Berhasil menambahkan ruangan"),
            ),
          );
        }
      }
    } catch (e) {
      if (widget.updatedRuangan != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Text(e.toString()),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 120,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Text(e.toString()),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
                controller: _kodeRuangController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.qr_code),
                  hintText: 'Enter kode ruang',
                  labelText: 'Kode Ruang',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kode ruang tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
          ),
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
                controller: _namaRuangController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.door_front_door),
                  hintText: 'Enter nama ruang',
                  labelText: 'Nama Ruang',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama ruang tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
          ),
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
                controller: _kapasitasController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter kapasitas',
                  labelText: 'Kapasitas',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kapasitas tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
          ),
          const Text("Gedung"),
          DropdownButton<Gedung>(
            value: _gedung,
            items: _gedungList.map((Gedung e) {
              return DropdownMenuItem<Gedung>(
                value: e,
                child: Text(e.namaGedung),
              );
            }).toList(),
            onChanged: (value) {
              setState(
                () {
                  _gedung = value!;
                },
              );
            },
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
