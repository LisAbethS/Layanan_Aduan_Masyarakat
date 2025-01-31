import 'package:flutter/material.dart';

class Penanganan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pelajari Kasus'),
        backgroundColor: Colors.red[200],
      ),
      body: ListView(
        children: [
          buildReportCard(
            context,
            'Kebakaran',
            '''Kebakaran adalah kejadian yang disebabkan oleh api yang merambat dan menghanguskan bahan yang mudah terbakar. Kebakaran dapat terjadi di berbagai tempat, seperti rumah, hutan, atau gedung. Kebakaran seringkali disebabkan oleh kelalaian manusia, kebocoran gas, atau faktor alam seperti petir.
Cara Menangani Kasus Kebakaran:

Evakuasi: Segera evakuasi orang-orang yang berada di sekitar lokasi kebakaran ke tempat yang aman.
Menggunakan Alat Pemadam Kebakaran: Jika kebakaran masih kecil, segera gunakan alat pemadam kebakaran yang tersedia untuk memadamkan api.
Hubungi Pemadam Kebakaran: Jika kebakaran sudah meluas, hubungi pemadam kebakaran dan beri tahu lokasi kebakaran.
Jauhi Bahaya: Jangan coba-coba memadamkan kebakaran yang terlalu besar, dan hindari paparan asap atau gas berbahaya yang dapat menyebabkan keracunan.''',
            'https://i.pinimg.com/736x/15/06/8a/15068a3f67eb60b8203fc0ff40768614.jpg',
            '24 Januari 2025',
          ),
          buildReportCard(
            context,
            'Medis',
            '''Kasus medis mencakup berbagai kondisi darurat, seperti luka serius, cedera, serangan jantung, atau masalah pernapasan. Penanganan medis darurat sangat penting untuk mencegah kematian atau cacat jangka panjang. Penderita memerlukan penanganan segera dan tepat oleh tenaga medis terlatih.
Cara Menangani Kasus Medis:

Luka dan Cedera: Lakukan pertolongan pertama dengan membersihkan luka, menekan untuk menghentikan perdarahan, dan membalut luka dengan kain bersih.
Serangan Jantung: Jika seseorang mengalami gejala serangan jantung (nyeri dada, sesak napas), segera hubungi layanan darurat dan bantu pasien untuk tetap tenang.
Masalah Pernapasan: Jika seseorang mengalami kesulitan bernapas, bantu mereka dengan posisi duduk tegak dan pastikan jalan napas terbuka. Jika perlu, berikan bantuan pernapasan.
Pertolongan Pertama: Ketahui langkah-langkah dasar pertolongan pertama untuk berbagai kondisi medis seperti pingsan, keracunan, atau gegar otak.''',
            'https://i.pinimg.com/736x/d2/1c/6d/d21c6d43dd6669ea4563f49de7b5829b.jpg',
            '23 Januari 2025',
          ),
          buildReportCard(
            context,
            'Bencana Alam',
            '''Bencana alam adalah peristiwa yang terjadi akibat aktivitas alam, seperti gempa bumi, tsunami, banjir, atau letusan gunung berapi. Bencana ini dapat menyebabkan kerusakan besar, termasuk kehilangan nyawa dan harta benda, serta menghancurkan infrastruktur.
Cara Menangani Kasus Bencana Alam:

Gempa Bumi: Jika terjadi gempa bumi, segera berlindung di tempat yang aman seperti di bawah meja atau di dekat dinding yang kokoh. Setelah gempa, periksa korban dan segera evakuasi jika diperlukan.
Banjir: Hindari perjalanan di area banjir dan carilah tempat tinggi untuk berlindung. Jika Anda berada di rumah yang terendam banjir, cari tempat yang lebih tinggi dan hubungi petugas penyelamat.
Tsunami: Jika berada di pantai dan merasakan gempa, segera pergi ke tempat yang lebih tinggi karena tsunami dapat mengikuti gempa tersebut. Ikuti perintah evakuasi dari pihak berwenang.
Letusan Gunung Berapi: Jika terjadi letusan, segera mengungsi ke tempat yang lebih aman dan ikuti rute evakuasi yang sudah disiapkan. Hindari paparan debu vulkanik yang dapat membahayakan pernapasan.''',
            'https://i.pinimg.com/736x/79/39/27/7939277161d5bfef25312d9e309ed8d7.jpg',
            '22 Januari 2025',
          ),
            buildReportCard(
            context,
            'Bencana Alam',
            '''Bencana alam adalah peristiwa yang terjadi akibat aktivitas alam, seperti gempa bumi, tsunami, banjir, atau letusan gunung berapi. Bencana ini dapat menyebabkan kerusakan besar, termasuk kehilangan nyawa dan harta benda, serta menghancurkan infrastruktur.
Cara Menangani Kasus Bencana Alam:

Gempa Bumi: Jika terjadi gempa bumi, segera berlindung di tempat yang aman seperti di bawah meja atau di dekat dinding yang kokoh. Setelah gempa, periksa korban dan segera evakuasi jika diperlukan.
Banjir: Hindari perjalanan di area banjir dan carilah tempat tinggi untuk berlindung. Jika Anda berada di rumah yang terendam banjir, cari tempat yang lebih tinggi dan hubungi petugas penyelamat.
Tsunami: Jika berada di pantai dan merasakan gempa, segera pergi ke tempat yang lebih tinggi karena tsunami dapat mengikuti gempa tersebut. Ikuti perintah evakuasi dari pihak berwenang.
Letusan Gunung Berapi: Jika terjadi letusan, segera mengungsi ke tempat yang lebih aman dan ikuti rute evakuasi yang sudah disiapkan. Hindari paparan debu vulkanik yang dapat membahayakan pernapasan.''',
            'https://i.pinimg.com/736x/79/39/27/7939277161d5bfef25312d9e309ed8d7.jpg',
            '22 Januari 2025',
          ),
        ],
      ),
    );
  }

  Widget buildReportCard(BuildContext context, String title, String description, String imageUrl, String date) {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Tanggal: $date',
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
