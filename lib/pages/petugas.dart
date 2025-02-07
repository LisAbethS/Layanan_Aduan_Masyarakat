import 'package:flutter/material.dart';

class Petugas extends StatefulWidget {
  const Petugas({Key? key}) : super(key: key);

  @override
  State<Petugas> createState() => _PetugasPageState();
}

class _PetugasPageState extends State<Petugas> {
  // Contoh data laporan
  final List<Map<String, dynamic>> laporanList = [
    {'jenis': 'Laporan Kebersihan', 'status': 'Diterima', 'progres': 'Belum Dikerjakan'},
    {'jenis': 'Laporan Kerusakan', 'status': 'Ditolak', 'progres': 'Tidak Berlaku'},
    {'jenis': 'Laporan Perbaikan AC', 'status': 'Diterima', 'progres': 'Belum Dikerjakan'},
  ];

  void updateProgres(int index, String newProgres) {
    setState(() {
      laporanList[index]['progres'] = newProgres;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Petugas'),
        backgroundColor: Colors.blue[800],
      ),
      body: ListView.builder(
        itemCount: laporanList.length,
        itemBuilder: (context, index) {
          final laporan = laporanList[index];
          final status = laporan['status'];
          final progres = laporan['progres'];

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              title: Text(laporan['jenis']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Status: $status'),
                  Text('Progres: $progres'),
                ],
              ),
              trailing: status == 'Diterima'
                  ? PopupMenuButton<String>(
                      onSelected: (value) => updateProgres(index, value),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'Dikerjakan',
                          child: Text('Dikerjakan'),
                        ),
                        const PopupMenuItem(
                          value: 'Selesai',
                          child: Text('Selesai'),
                        ),
                      ],
                      icon: const Icon(Icons.edit),
                    )
                  : const Text(
                      'Tidak Ada Aksi',
                      style: TextStyle(color: Colors.grey),
                    ),
            ),
          );
        },
      ),
    );
  }
}
