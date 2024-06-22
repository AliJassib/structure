import 'package:Trip/config/constant.dart';
import 'package:Trip/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff074875),
              Color(0xff032238),
            ],
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            SizedBox(height: Insets.exLarge * 4),
            Center(
              child: Padding(
                padding: EdgeInsets.all(Insets.small),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      Assets.assetsIconsLogoleft,
                      width: Insets.exLarge * 2,
                    ).animate(
                      autoPlay: true,
                      effects: [
                        FadeEffect(duration: 1000.ms, curve: Curves.easeOut),
                        MoveEffect(
                          duration: 800.ms,
                          curve: Curves.easeInSine,
                          begin: const Offset(50, 0),
                          end: const Offset(0, 0),
                        ),
                      ],
                    ),
                    Image.asset(
                      Assets.assetsIconsLogo2,
                      width: Insets.exLarge * 3.5,
                    ).animate(
                      autoPlay: true,
                      onComplete: (controller) {
                        if (mounted) {
                          Future.delayed(100.ms).then(
                            (value) {
                              if (prefs.getString('token') == null) {
                                // Get.offAll(() => const IntroPage(),
                                //     transition: Transition.fadeIn);
                              } else {
                                // Get.offAll(() => const NavigationPage());
                              }
                            },
                          );
                        }
                      },
                      effects: [
                        FadeEffect(duration: 1000.ms, curve: Curves.easeOut),
                        ScaleEffect(
                          duration: 800.ms,
                          curve: Curves.easeInSine,
                          begin: const Offset(0.3, 0.3),
                          end: const Offset(1, 1),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      Assets.assetsIconsLogoright,
                      width: Insets.exLarge * 2,
                    ).animate(
                      autoPlay: true,
                      effects: [
                        FadeEffect(duration: 2000.ms, curve: Curves.easeOut),
                        MoveEffect(
                          duration: 800.ms,
                          curve: Curves.easeInSine,
                          begin: const Offset(-50, 0),
                          end: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'جمهورية العراق'.tr,
              style: context.textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: Insets.small,
            ),
            Text(
              'وزارة الداخلية'.tr,
              style: context.textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              Assets.assetsIconsVectors,
              width: context.width,
            ).animate(
              autoPlay: true,
              effects: [
                FadeEffect(duration: 1000.ms, curve: Curves.easeOut),
                MoveEffect(
                  duration: 800.ms,
                  curve: Curves.easeInSine,
                  begin: const Offset(0, 50),
                  end: const Offset(0, 0),
                ),
              ],
            ),
          ].animate(interval: 100.ms).fadeIn(duration: 1200.ms),
        ),
      ),
    );
  }
}
