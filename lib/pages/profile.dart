import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nama Pengguna',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('pengguna@email.com'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Informasi Tambahan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Nomor Telepon: +62 812-3456-7890'),
            const SizedBox(height: 8),
            const Text('Alamat: Jalan Kebangsaan No. 123, Kota Semarang'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Logika untuk edit profil
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Edit Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
