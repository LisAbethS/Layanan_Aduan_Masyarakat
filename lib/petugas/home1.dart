import 'package:flutter/material.dart';

// Halaman detail untuk menampilkan informasi laporan
class DetailPage extends StatelessWidget {
  final int reportId;

  const DetailPage({Key? key, required this.reportId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Detail Laporan",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Laporan #$reportId",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "Deskripsi laporan lengkap...",
              style: TextStyle(fontSize: 16),
            ),
            // Bisa ditambahkan lebih banyak detail di sini sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}

// Halaman utama yang berisi list laporan
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String filterStatus = "Diterima";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Laporan Pengaduan Masyarakat",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    filterStatus = "Diterima";
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: filterStatus == "Diterima" ? Colors.lightBlueAccent : Colors.blue,
                ),
                child: const Text("Diterima"),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    filterStatus = "Ditolak";
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: filterStatus == "Ditolak" ? Colors.lightBlueAccent : Colors.blue,
                ),
                child: const Text("Ditolak"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 4, // Jumlah laporan
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    color: Colors.grey[300],
                    child: ListTile(
                      title: Text("Laporan #${index + 1}"),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Aksi saat tombol view ditekan, buka halaman detail
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                reportId: index + 1, // Mengirim ID laporan
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        child: const Text("View"),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationPage(),
  ));
}
