import 'package:expose_corruption_app/screens/home.dart';
import 'package:expose_corruption_app/screens/register.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd8d2cb),
      appBar: AppBar(
        title: const Text("Log In"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child:
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 150),
                  child: 
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _emailController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                controller: _passwordController,
                textAlign: TextAlign.center,
                obscureText: _obscureText, 
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.lock),
                  hintText: "Enter Password",
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
                const SizedBox(height: 60),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home() ));
                      ();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4B0082),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(3650, 50),
                    ),
                    child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Don't have an account?",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Register(),
                    ));
                  },
                  child: const Text(
                    'Sign up Here',
                    style: TextStyle(color: Color(0xFF4B0082)),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}

