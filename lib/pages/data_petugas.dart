import 'package:flutter/material.dart';

class DataPetugas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Petugas'),
        backgroundColor: Colors.green[200],
      ),
      body: ListView(
        children: [
          buildPetugasCard(
            context,
            'John Doe',
            'Petugas Keamanan',
            'https://www.w3schools.com/w3images/avatar2.png',
            'Bergabung: 15 Januari 2024',
          ),
          buildPetugasCard(
            context,
            'Jane Smith',
            'Petugas Kesehatan',
            'https://www.w3schools.com/w3images/avatar2.png',
            'Bergabung: 10 Februari 2024',
          ),
          buildPetugasCard(
            context,
            'Michael Brown',
            'Petugas Kebersihan',
            'https://www.w3schools.com/w3images/avatar2.png',
            'Bergabung: 20 Maret 2024',
          ),
        ],
      ),
    );
  }

  Widget buildPetugasCard(BuildContext context, String name, String position, String imageUrl, String joinDate) {
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
                  position,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  joinDate,
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
