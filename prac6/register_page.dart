import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

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

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Данные успешно прошли проверку'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),

              child: Form(
                key: _formKey,

                child: Column(
                  children: [

                    const SizedBox(height: 50),

                    const Text(
                      'Регистрация',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 60),

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
                        onPressed: _register,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),

                        child: const Text(
                          'Зарегистрироваться',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 80),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Уже есть аккаунт? ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Войдите',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
      home: RegisterPage(),
    ),
  );
}
