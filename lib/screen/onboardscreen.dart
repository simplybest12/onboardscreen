import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});
  @override
  State<OnBoard> createState() => _OnBoardState();
}
 
class _OnBoardState extends State<OnBoard> {
  List<Color> colorizeColors = [ 
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  bool _isAnimationRunning = true;
  dynamic colorizeTextStyle = GoogleFonts.ubuntu(
    fontSize: 20,
  );

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
                width: MediaQuery.of(context).size.width * 1.7,
                bottom: 200,
                left: 80,
                child: Image.asset('assets/Background/Spline.png')),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            )),
            const SizedBox.expand(
                child: RiveAnimation.asset(
              'assets/RiveAssets/shapes.riv',
              fit: BoxFit.cover,
            )),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text("Hello,",
                        style: GoogleFonts.pacifico(
                            fontSize: 32, color: Colors.white)),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 100,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Visibility(
                            visible: !_isAnimationRunning,
                            child: Text(
                              " Connections..",
                              style: GoogleFonts.righteous(
                                  letterSpacing: 1.2,
                                  fontSize: 32.0,
                                  color: Colors.orange[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          DefaultTextStyle(
                            style: GoogleFonts.righteous(
                                letterSpacing: 1.2,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                            child: AnimatedTextKit(
                              onFinished: () {
                                setState(() {
                                  _isAnimationRunning = false;
                                });
                              },
                              // repeatForever: true,
                              totalRepeatCount: 3,
                              pause: const Duration(seconds: 2),
                              animatedTexts: [
                                RotateAnimatedText(' LinkedIn,',
                                    textStyle: GoogleFonts.righteous(
                                        letterSpacing: 1.2,
                                        fontSize: 32.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    duration:
                                        const Duration(milliseconds: 3500)),
                                RotateAnimatedText(' Family,',
                                    textStyle: GoogleFonts.righteous(
                                        letterSpacing: 1.2,
                                        fontSize: 32.0,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold),
                                    duration:
                                        const Duration(milliseconds: 3500)),
                                RotateAnimatedText(' And Friends...',
                                    textStyle: GoogleFonts.righteous(
                                        letterSpacing: 1.2,
                                        fontSize: 32.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    duration:
                                        const Duration(milliseconds: 3500)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Learn\n",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                          TextSpan(
                            text: "design\n",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.amber,
                              fontSize: 50,
                            ),
                          ),
                          TextSpan(
                            text: "& ",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.grey,
                              fontSize: 50,
                            ),
                          ),
                          TextSpan(
                            text: "code.",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DefaultTextStyle(
                    style: GoogleFonts.montserratAlternates(
                        fontSize: 25.0, color: Colors.white
                        // fontFamily: 'Agne',
                        ),
                    child: AnimatedTextKit(
                      pause: const Duration(milliseconds: 3500),
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TypewriterAnimatedText(
                            speed: const Duration(milliseconds: 180),
                            "I am a flutter developer and a passionate programmer.\nBased on my experience and work on flutter i'll be uploading amazing animations and projects regularly.\nSo Stay tuned!"),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  child: AnimatedTextKit(
                    pause: Duration(milliseconds: 200),
                    animatedTexts: [
                      ColorizeAnimatedText(
                        speed: const Duration(milliseconds: 1000),
                        'For Source Code\n  visit my github',
                        textStyle: colorizeTextStyle,
                        
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
                const SizedBox(
                  height: 25,
                )
              ]),
            )
          ],
        ));
  }
}
