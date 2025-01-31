import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {'id': '1', 'status': 'Ditolak'},
    {'id': '2', 'status': 'Diterima'},
    {'id': '3', 'status': 'Dikerjakan'},
    {'id': '4', 'status': 'Selesai'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progres Laporan')),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Laporan ${reports[index]['id']}'),
            subtitle: Text('Status: ${reports[index]['status']}'),
            trailing: Icon(Icons.info_outline),
            onTap: () {
              // Bisa ditambahkan navigasi ke detail laporan
            },
          );
        },
      ),
    );
  }
}
