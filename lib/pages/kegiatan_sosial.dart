import 'package:flutter/material.dart';

class KegiatanSosial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatan Sosial'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: [
          buildKegiatanCard(
            context,
            'Donasi Darah',
            'Donasi darah untuk membantu pasien yang membutuhkan transfusi darah. Acara ini dilakukan di rumah sakit setempat.',
            'https://i.pinimg.com/736x/09/e2/5c/09e25c9f97c3aa13ecda7a2692b54d47.jpg',
            '25 Januari 2025',
          ),
          buildKegiatanCard(
            context,
            'Kegiatan Bersih-Bersih Lingkungan',
            'Ayo berpartisipasi dalam kegiatan bersih-bersih lingkungan di sekitar asrama. Mari bersama-sama menjaga kebersihan.',
            'https://i.pinimg.com/736x/a9/20/98/a92098268c94397acfd9c13712c77d29.jpg',
            '30 Januari 2025',
          ),
          buildKegiatanCard(
            context,
            'Bakti Sosial di Panti Asuhan',
            'Kegiatan bakti sosial berupa pemberian bantuan kepada panti asuhan di sekitar kota. Ajak teman-teman untuk turut serta.',
            'https://i.pinimg.com/736x/f2/7d/e3/f27de34345aa43206887266af32b3f39.jpg',
            '5 Februari 2025',
          ),
        ],
      ),
    );
  }

  Widget buildKegiatanCard(BuildContext context, String title, String description, String imageUrl, String date) {
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
