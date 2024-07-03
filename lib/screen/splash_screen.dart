import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _vController;
  late Animation<double> _imageAnimation;

  void exitscreentohomePage(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
  
  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _imageAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeIn),
    );

    _vController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _imageController.forward().then((_) {
      _vController.forward();
    });

    _loadResources();
  }

  Future<void> _loadResources() async {
    // Simulate a network request or some async task
    await Future.delayed(const Duration(seconds: 5));
    // Navigate to the home screen
    exitscreentohomePage();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _vController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, 
      body: Center(
        child: FadeTransition(
          opacity: _imageAnimation,
          child: Container(
            width: 200, 
            height: 200, 
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
