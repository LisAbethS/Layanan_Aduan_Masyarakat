import 'dart:io'; // Menambahkan impor untuk File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Untuk mengambil foto

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  List<XFile>? _images = [];

  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk memilih foto
  Future<void> _pickImage() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    setState(() {
      if (selectedImages != null) {
        _images = selectedImages;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buat Laporan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi Laporan'),
              maxLines: 4,
            ),
            SizedBox(height: 10),
            Text('Pilih Foto:'),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Ambil Foto'),
            ),
            SizedBox(height: 10),
            Text('Foto Terpilih:'),
            _images!.isEmpty
                ? Text('Tidak ada foto yang dipilih')
                : Column(
                    children: _images!.map((image) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            File(image.path), // Pastikan File(image.path)
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
            SizedBox(height: 20),
            // Tabel untuk alamat
            Text('Alamat Laporan:'),
            Table(
              columnWidths: {
                0: FixedColumnWidth(100),
                1: FixedColumnWidth(200),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Jalan:'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _streetController,
                        decoration: InputDecoration(hintText: 'Masukkan Jalan'),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Kota:'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _cityController,
                        decoration: InputDecoration(hintText: 'Masukkan Kota'),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Kode Pos:'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _postalCodeController,
                        decoration: InputDecoration(hintText: 'Masukkan Kode Pos'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kirim laporan ke server atau simpan di database
              },
              child: Text('Kirim Laporan'),
            ),
          ],
        ),
      ),
    );
  }
}
