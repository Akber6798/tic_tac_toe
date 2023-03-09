import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';
import 'package:tic_tac_toe/utilities/app_values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Text('TIC TAC TOE',
                style: GoogleFonts.kaushanScript(
                    textStyle: TextStyle(
                        color: AppValues.whiteColor, fontSize: 50.sp))),
            SizedBox(height: 40.h),
            AvatarGlow(
              endRadius: 140,
              duration: const Duration(seconds: 4),
              glowColor: Colors.white,
              repeat: true,
              child: CircleAvatar(
                radius: 90,
                backgroundColor: Colors.grey[900],
                child: const Image(
                    height: 270,
                    width: 270,
                    color: Colors.white,
                    image: AssetImage('assets/logo.png')),
              ),
            ),
            SizedBox(height: 85.h),
            SizedBox(
                height: 65.h,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppValues.whiteColor, shape: const StadiumBorder()),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const HomeScreen())));
                  },
                  child: Text('PLAY GAME',
                      style: GoogleFonts.kaushanScript(
                        textStyle: TextStyle(
                            color: AppValues.mainColor, fontSize: 30.sp),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
