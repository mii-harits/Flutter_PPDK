import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'get_game_of_thrones_data.dart';

class GotSplashScreen extends StatefulWidget {
  const GotSplashScreen({super.key});

  @override
  State<GotSplashScreen> createState() => _GotSplashScreen();
}

class _GotSplashScreen extends State<GotSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _textController;

  late Animation<double> _fade;
  late Animation<double> _scale;
  late Animation<double> _blur;

  late Animation<Offset> _slideText;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // 🔥 Fade in dari gelap
    _fade = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _mainController, curve: Curves.easeIn));

    // 🔥 Zoom effect
    _scale = Tween(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _mainController, curve: Curves.easeOut));

    // 🔥 Blur hilang pelan
    _blur = Tween(
      begin: 10.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _mainController, curve: Curves.easeOut));

    // ✨ Text slide dari bawah
    _slideText = Tween(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _mainController.forward();

    Future.delayed(const Duration(milliseconds: 800), () {
      _textController.forward();
    });

    // 🚀 pindah halaman
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const GetGameOfThronesData(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _mainController,
        builder: (context, child) {
          return Stack(
            children: [
              // 🌫️ BACKGROUND GRADIENT CINEMATIC
              Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0, -0.3),
                    radius: 1.2,
                    colors: [Color(0xFF1a1a1a), Colors.black],
                  ),
                ),
              ),

              // 🌫️ BLUR EFFECT
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: _blur.value,
                  sigmaY: _blur.value,
                ),
                child: Container(color: Colors.black.withOpacity(0.2)),
              ),

              // 🎬 CONTENT
              Center(
                child: FadeTransition(
                  opacity: _fade,
                  child: ScaleTransition(
                    scale: _scale,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 🔥 LOGO
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.3),
                                blurRadius: 30,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.whatshot,
                            color: Colors.white,
                            size: 90,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // 🐉 TITLE ANIMATION
                        SlideTransition(
                          position: _slideText,
                          child: FadeTransition(
                            opacity: _textController,
                            child: const Text(
                              "GAME OF THRONES",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // ✨ SUBTITLE
                        SlideTransition(
                          position: _slideText,
                          child: FadeTransition(
                            opacity: _textController,
                            child: Text(
                              "Thrones Archive",
                              style: TextStyle(
                                color: Colors.grey[400],
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // 🔄 LOADING ANIMATION CUSTOM
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(
                              Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
