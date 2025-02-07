import 'package:flutter/material.dart';
import 'penanganan.dart';
import 'kontak_darurat.dart';
import 'kegiatan_sosial.dart';
import 'data_petugas.dart';
import 'detail_Laporan.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    BuatLaporanPage(),
    ListLaporanPage(),
  //    ProfilePage(nama: 'eliza', email: 'eliza17@gmail.com'),
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
          'Laporan Pengaduan Masyarakat',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
            label: 'Riwayat laporan',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'Profile',
          // ),
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

// class buatlaporan
class BuatLaporanPage extends StatelessWidget {
  final TextEditingController jenisLaporanController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Laporan'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: const Color.fromARGB(255, 246, 246, 247),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(
                    controller: jenisLaporanController,
                    labelText: 'Jenis Laporan',
                    hintText: 'Masukkan jenis laporan',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Foto Dokumentasi:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPhotoBox('Foto 1'),
                      _buildPhotoBox('Foto 2'),
                      _buildPhotoBox('Foto 3'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: alamatController,
                    labelText: 'Alamat',
                    hintText: 'Masukkan alamat lokasi kejadian',
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: keteranganController,
                    labelText: 'Keterangan',
                    hintText: 'Masukkan keterangan tambahan',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Fungsi berbagi lokasi belum diimplementasikan'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.location_on),
                      label: const Text('Bagikan Lokasi'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (jenisLaporanController.text.isNotEmpty && alamatController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailLaporan(
                                jenisLaporan: jenisLaporanController.text,
                                alamat: alamatController.text,
                                keterangan: keteranganController.text,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Harap isi semua data laporan yang wajib!'),
                            ),
                          );
                        }
                      },
                      child: const Text('Kirim Laporan'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      maxLines: maxLines,
    );
  }

  Widget _buildPhotoBox(String label) {
    return GestureDetector(
      onTap: () {
        // Tambahkan logika untuk mengambil foto di sini
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}


//class detaillaporan
class ListLaporanPage extends StatefulWidget {
  @override
  _ListLaporanPageState createState() => _ListLaporanPageState();
}

class _ListLaporanPageState extends State<ListLaporanPage> {
  final List<Map<String, String>> laporanList = [
    {'title': 'Kebakaran', 'status': 'Diterima'},
    {'title': 'Banjir', 'status': 'Ditolak'},
    {'title': 'Gempa Bumi', 'status': 'Dikerjakan'},
    {'title': 'Tanah Longsor', 'status': 'Selesai'},
    {'title': 'Tsunami', 'status': 'Diterima'},
    {'title': 'Kecelakaan', 'status': 'Ditolak'},
  ];

  final Map<String, Color> statusColors = {
    'Diterima': Colors.green,
    'Ditolak': Colors.red,
    'Dikerjakan': Colors.blue,
    'Selesai': Colors.lightBlueAccent,
  };

  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredLaporan = selectedStatus == null
        ? laporanList
        : laporanList
            .where((laporan) => laporan['status'] == selectedStatus)
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Laporan Pengaduan Masyarakat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHeaderDecoration(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: statusColors.entries
                  .map((entry) => _buildStatusChip(entry.key, entry.value))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredLaporan.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredLaporan.length,
                      itemBuilder: (context, index) {
                        return _buildLaporanCard(
                          filteredLaporan[index]['title'] ?? '',
                          filteredLaporan[index]['status'] ?? '',
                        );
                      },
                    )
                  : const Center(
                      child: Text("Tidak ada laporan untuk status ini."),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderDecoration() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Hallo Pengguna!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Laporkan jika terjadi keadaan darurat. Instansi terdekat akan segera sampai di sana.',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStatus = selectedStatus == status ? null : status;
        });
      },
      child: Chip(
        label: Text(
          status,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
      ),
    );
  }

  Widget _buildLaporanCard(String title, String status) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailLaporanPage(
                      title: title,
                      status: status,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: statusColors[status] ?? Colors.grey,
              ),
              child: const Text('View'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailLaporanPage extends StatelessWidget {
  final String title;
  final String status;

  const DetailLaporanPage({super.key, required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Detail Laporan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul Laporan: $title',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: $status',
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}




//class profilepage
// class ProfilePage extends StatelessWidget {
//   final String nama;
//   final String email;

//   const ProfilePage({Key? key, required this.nama, required this.email}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profil Pengguna'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             _buildProfilePicture(),
//             const SizedBox(height: 20),
//             Text(
//               nama,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               email,
//               style: const TextStyle(color: Colors.grey),
//             ),
//             const SizedBox(height: 24),
//             OutlinedButton.icon(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.logout, color: Colors.red),
//               label: const Text('Logout', style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfilePicture() {
//     return CircleAvatar(
//       radius: 50,
//       backgroundImage: AssetImage('assets/profile_placeholder.png'),
//       backgroundColor: Colors.grey[300],
//     );
//   }
// }
