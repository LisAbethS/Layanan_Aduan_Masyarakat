import 'package:flutter/material.dart';
import 'penanganan.dart';
import 'kontak_darurat.dart';
import 'kegiatan_sosial.dart';
import 'data_petugas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan saat memilih item di BottomNavigationBar
  final List<Widget> _pages = [
    HomePage(),
    BuatLaporanPage(), // Pastikan BuatLaporanPage sudah ada
    DetailLaporanPage(), // Pastikan DetailLaporanPage sudah ada
    ProfilePage(), // Pastikan ProfilePage sudah ada
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 70, 134),
        title: Text(
          'Laporan pengaduan masyarakat',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      // Navbar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Mengubah halaman berdasarkan item yang dipilih
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue[800],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Buat Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Detail Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Container(
            height: 200, // Tinggi container biru
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Membuat jarak antara teks dan avatar
              crossAxisAlignment: CrossAxisAlignment.center, // Meratakan elemen secara vertikal
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Posisi teks di tengah vertikal
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo Pengguna!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8), // Jarak antara teks judul dan deskripsi
                      Text(
                        'Laporkan jika terjadi keadaan darurat\ninstansi terdekat akan segera sampai disana.',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30), // Jarak antara header dan GridView
          // Card Section
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              padding: const EdgeInsets.all(16.0),
              children: [
                CardItem(
                  title: 'Pelajari Kasus',
                  color: Colors.red[200],
                  icon: Icons.local_hospital,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Penanganan(),
                      ),
                    );
                  },
                ),
                CardItem(
                  title: 'Data Petugas',
                  color: Colors.green[200],
                  icon: Icons.group,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataPetugas(),
                      ),
                    );
                  },
                ),
                CardItem(
                  title: 'Kontak Darurat',
                  color: Colors.yellow[200],
                  icon: Icons.phone,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KontakDarurat(),
                      ),
                    );
                  },
                ),
                CardItem(
                  title: 'Kegiatan Sosial',
                  color: Colors.blue[200],
                  icon: Icons.event,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KegiatanSosial(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final Color? color;
  final IconData icon;
  final VoidCallback onTap;

  const CardItem({
    required this.title,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: color,
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black87),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Pastikan halaman BuatLaporanPage, DetailLaporanPage, ProfilePage sudah ada
class BuatLaporanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Laporan'),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Text('Halaman Buat Laporan'),
      ),
    );
  }
}

class DetailLaporanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Laporan'),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Text('Halaman Detail Laporan'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Text('Halaman Profile'),
      ),
    );
  }
}

