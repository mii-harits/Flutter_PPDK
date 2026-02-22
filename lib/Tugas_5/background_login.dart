import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1️⃣ Soft white base (tidak pure white)
      Container(
        color: const Color(0xffF8FAF9),
      ),

      // 2️⃣ Subtle teal glow (sangat halus)
      Positioned(
        top: -120,
        right: -80,
        child: Container(
          width: 320,
          height: 320,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                const Color(0xff00897B).withOpacity(0.18),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),

      // 3️⃣ Mint ambient glow bawah
      Positioned(
        bottom: -150,
        left: -100,
        child: Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                const Color(0xffA5D6A7).withOpacity(0.15),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
      ],
    );
  }
}