import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:smart_medic/iconbtn/daftar.dart';
import 'dart:convert';

import 'package:smart_medic/services/base_url.dart';

class DaftarPenyakit extends StatefulWidget {
  static const routeName = '/daftarpenyakit';

  @override
  State<DaftarPenyakit> createState() => _DaftarPenyakitState();
}

class _DaftarPenyakitState extends State<DaftarPenyakit> {
  final formKey = GlobalKey<FormState>();
  TextEditingController penyakitController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController waktuController = TextEditingController();

  /*
      nama fungsi : _simpan
      deskripsi : untuk menambahkan data ke api
      parameter : -
      return : memberikan return true/false
      dibuat oleh : Rangga
      tanggal dibuat : 9/2/2023
    */
  Future _simpan() async {
    final response =
        await http.post(Uri.parse(baseUrl.links+'create.php'), body: {
      "nama_penyakit": penyakitController.text,
      "keterangan": keteranganController.text,
      "status": statusController.text,
      "waktu": waktuController.text,
    });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  /*
      nama fungsi : getPenyakit
      deskripsi : untuk mengambil data dari api
      parameter : -
      return : response.body
      dibuat oleh : Rangga
      tanggal dibuat : 8/2/2023
    */
  // Future getPenyakit() async {
  //   final url = Uri.parse(baseUrl.link + 'penyakit');
  //   var response = await http.get(url);
  //   return json.decode(response.body);
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daftar Penyakit"),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Tambah Penyakit",
                style: TextStyle(color: Colors.black38),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: penyakitController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Penyakit',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Penyakit tidak boleh kosong";
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextFormField(
                        controller: keteranganController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Keterangan',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Keterangan tidak boleh kosong";
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextFormField(
                        controller: statusController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Status',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Status tidak boleh kosong('Tunggu', 'Antrian', 'Periksa', 'Selesai')";
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextFormField(
                        controller: waktuController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Waktu',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Waktu tidak boleh kosong: Tahun-Bulan-Tanggal(2020-12-30)";
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // _futurePenyakit = createPenyakit(penyakitController.text,keteranganController.text,statusController.text,waktuController.text);
                          if (formKey.currentState!.validate()) {
                            _simpan().then((value) {
                              if (value) {
                                final snackBar = SnackBar(
                                  content: Text("Data berhasil di simpan"),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                final snackBar = SnackBar(
                                  content: Text("Data gagal di simpan"),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            });
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => Daftar())), (route) => false);
                          }
                        },
                        child: Text(
                          "Ajukan",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 140, right: 140),
                          backgroundColor: Colors.deepPurple,
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
