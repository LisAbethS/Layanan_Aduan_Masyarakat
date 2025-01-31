import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Controllers untuk password
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  // State untuk menyembunyikan/memperlihatkan password
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan warna biru tua
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.blue[900], // Warna biru tua untuk kesan tegas
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_alt_1,
                          size: 70,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Buat Akun Anda',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Bergabunglah dengan kami dan jelajahi lebih jauh',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Formulir
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  _buildTextField(
                    label: 'Nama',
                    hint: 'Masukan Nama',
                    icon: Icons.person,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    label: 'Email',
                    hint: 'Masukan Email',
                    icon: Icons.email,
                  ),
                  SizedBox(height: 16),
                  _buildPasswordField(
                    label: 'Sandi',
                    hint: 'Masukan Sandi',
                    controller: _passwordController,
                    isPasswordVisible: _isPasswordVisible,
                    togglePasswordVisibility: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  _buildPasswordField(
                    label: 'Konfirmasi sandi',
                    hint: 'Masukan Konfirmasi sandi',
                    controller: _confirmPasswordController,
                    isPasswordVisible: _isConfirmPasswordVisible,
                    togglePasswordVisibility: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                  SizedBox(height: 24),

                  // Tombol Register dengan warna biru muda
                 ElevatedButton(
                    onPressed: () {
                      // Setelah tombol Daftar diklik, pindahkan ke halaman Home
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()), // Ganti dengan halaman Home
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Warna biru muda untuk tombol
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Tombol Login dengan Google
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.login, color: Colors.blue),
                    label: Text(
                      'Masuk dengan Google',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Teks "Sudah punya akun?"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sudah punya akun? "),
                     GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman login
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()), // Pindah ke halaman Login
                          );
                        },
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membangun TextField
  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.blue),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Widget untuk membangun Password Field
  Widget _buildPasswordField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required bool isPasswordVisible,
    required VoidCallback togglePasswordVisibility,
  }) {
    return TextField(
      controller: controller,
      obscureText: !isPasswordVisible, // Menyembunyikan teks jika isPasswordVisible false
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(Icons.lock, color: Colors.blue),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.blue,
          ),
          onPressed: togglePasswordVisibility,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
