import 'package:flutter/material.dart';
import 'package:intec_app/src/pages/todo_list_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String _defaultUsername = 'Admin';
  final String _defaultPassword = '1234';

  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Center(
                    child: Image.asset(
                      'images/market-icon-remove.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Bienvenido! Por favor, inicia sesión',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de usuario',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor inserta tu nombre de usuario';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor inserta tu contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  _errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final username = _usernameController.text;
                      final password = _passwordController.text;
                      if (username == _defaultUsername &&
                          password == _defaultPassword) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TodoListPage(),
                          ),
                        );
                      } else {
                        setState(() {
                          _errorMessage =
                              'Datos erroneo (mira la nota secreta de abajo).';
                        });
                      }
                    }
                  },
                  child: Text('Entrar'),
                ),
                Spacer(),
                Text(
                  'Nombre de usuario: $_defaultUsername\nContraseña: $_defaultPassword',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
