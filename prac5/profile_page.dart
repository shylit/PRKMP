import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Данные профиля успешно проверены'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black12,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 40),

                  CustomTextFormField(
                    inputType: InputFieldType.name,
                    labelText: 'ФИО',
                    hintText: 'Введите ФИО',
                    prefixIcon: const Icon(Icons.person_outline),
                    controller: _nameController,
                  ),

                  const SizedBox(height: 15),

                  CustomTextFormField(
                    inputType: InputFieldType.email,
                    labelText: 'Email',
                    hintText: 'Введите email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    controller: _emailController,
                  ),

                  const SizedBox(height: 15),

                  CustomTextFormField(
                    inputType: InputFieldType.password,
                    labelText: 'Пароль',
                    hintText: 'Введите пароль',
                    prefixIcon: const Icon(Icons.security),
                    controller: _passwordController,
                  ),

                  const SizedBox(height: 15),

                  CustomTextFormField(
                    inputType: InputFieldType.confirmPassword,
                    labelText: 'Повторите пароль',
                    hintText: 'Повторите пароль',
                    prefixIcon: const Icon(Icons.security),
                    controller: _confirmPasswordController,
                    passwordController: _passwordController,
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: 220,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: _saveProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Сохранить',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    ),
  );
}
