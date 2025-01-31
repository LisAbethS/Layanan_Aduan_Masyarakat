import 'package:flutter/material.dart';

class KontakDarurat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak Darurat'),
        backgroundColor: Colors.blue[200],
      ),
      body: ListView(
        children: [
          buildKontakCard(
            context,
            'Polisi',
            '112',
            'https://i.pinimg.com/736x/b9/ea/e8/b9eae8eb6c24bbeaa76327f80e646d5e.jpg',
          ),
          buildKontakCard(
            context,
            'Pemadam Kebakaran',
            '113',
            'https://i.pinimg.com/736x/07/5c/77/075c77a6f95c191bd6419a22cf63af6f.jpg',
          ),
          buildKontakCard(
            context,
            'Ambulans',
            '118',
            'https://i.pinimg.com/736x/99/49/cb/9949cbd179be48f34511bdecfffc250b.jpg',
          ),
        ],
      ),
    );
  }

  Widget buildKontakCard(BuildContext context, String name, String phone, String imageUrl) {
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
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Nomor Telepon: $phone',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
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
