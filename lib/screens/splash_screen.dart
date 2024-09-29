import 'package:expose_corruption_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _animation.addListener(() {
      setState(() {});
    });
    _controller.forward();
    Future.delayed(const Duration(seconds: 3), () {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Login(),
      ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          Color backgroundColor = Color.lerp(
            Color(0xFF4B0082),
              Color(0xFF4169E1),
            _animation.value,
          ) ?? Color(0xFF00FFFF);

          double opacity = 1.0 - _animation.value;

          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: -MediaQuery.of(context).size.height * _animation.value,
                left: -MediaQuery.of(context).size.width * _animation.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: backgroundColor,
                ),
              ),
              Positioned(
                bottom: -MediaQuery.of(context).size.height * _animation.value,
                right: -MediaQuery.of(context).size.width * _animation.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: backgroundColor,
                ),
              ),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.gavel_rounded,
                      size: 80,
                      color: Color(0xFF4B0082),
                    ),
                    SizedBox(height: 14),
                    Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                      'Expose the Corrupt',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                    
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }}