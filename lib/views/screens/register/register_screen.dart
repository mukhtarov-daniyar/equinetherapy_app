// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Для уведомлений пользователю
import 'package:equinetherapy_app/views/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _imagePath;

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // void _register() async {
  //   // Проверка на заполнение всех полей и выбор изображения
  //   if (_nameController.text.isEmpty ||
  //       _emailController.text.isEmpty ||
  //       _phoneController.text.isEmpty ||
  //       _passwordController.text.isEmpty ||
  //       _imagePath == null) {
  //     Fluttertoast.showToast(
  //         msg: "Пожалуйста, заполните все поля и выберите изображение.",
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.CENTER);
  //     return;
  //   }

  //   try {
  //     final UserCredential userCredential =
  //         await _auth.createUserWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim(),
  //     );
  //     // Обновление отображаемого имени пользователя
  //     userCredential.user?.updateDisplayName(_nameController.text);
  //     print('Зарегистрированный пользователь: ${userCredential.user}');
  //     Navigator.of(context).pop(); // Переход на предыдущий экран или дашборд
  //   } on FirebaseAuthException catch (e) {
  //     Fluttertoast.showToast(
  //         msg: "Ошибка регистрации: ${e.message}",
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.CENTER);
  //     print('Ошибка регистрации: $e');
  //   }
  // }

  void _pickImage() {
    // Тут должна быть ваша логика для выбора изображения
    setState(() {
      _imagePath =
          'path/to/your/image.jpg'; // Замените на реальную логику выбора изображения
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade300,
                backgroundImage:
                    _imagePath != null ? NetworkImage(_imagePath!) : null,
                child: _imagePath == null
                    ? const Icon(Icons.add_a_photo, size: 50)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _nameController,
              label: 'ФИО',
              keyboardType: TextInputType.name,
            ),
            _buildTextField(
              controller: _emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            _buildTextField(
              controller: _phoneController,
              label: 'Номер телефона',
              keyboardType: TextInputType.phone,
            ),
            _buildTextField(
              controller: _passwordController,
              label: 'Пароль',
              obscureText: true,
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Зарегистрироваться',
              buttonColor: Colors.teal,
              onPressed: () {},
              // onPressed: _register,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 4,
        shadowColor: Colors.grey,
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
