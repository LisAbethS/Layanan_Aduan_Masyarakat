import 'package:flutter/material.dart';
import 'register.dart';
import 'home.dart'; // Import halaman notifikasi yang sudah dibuat sebelumnya

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controllers untuk email dan password
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // State untuk menyembunyikan/memperlihatkan password
  bool _isPasswordVisible = false;

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
                          Icons.login,
                          size: 70,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Selamat Datang',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Masuk untuk melanjutkan',
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

            // Formulir login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  // Email Field
                  _buildTextField(
                    label: 'Email',
                    hint: 'Masukan Email',
                    icon: Icons.email,
                    controller: _emailController,
                  ),
                  SizedBox(height: 16),

                  // Password Field
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
                  SizedBox(height: 24),

                  // Tombol Masuk dengan warna biru muda
                  ElevatedButton(
                    onPressed: () {
                      // Aksi saat tombol Masuk ditekan: Navigasi ke halaman Notifikasi
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage()
                        ),
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
                      'Masuk',
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

                  // Teks "Belum punya akun?"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Belum punya akun? "),
                      GestureDetector(
                        onTap: () {
                          // Pindah ke halaman Register
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          'Daftar',
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
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
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
