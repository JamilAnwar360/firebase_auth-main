import 'package:auth_firebase/src/features/auth/login_screen.dart';
import 'package:auth_firebase/src/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexstringtocolor("4b6cb7"),
              hexstringtocolor("182848"), // Change gradient end color here
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                // Your image sliders go here
                _buildSlideImage('assets/images/img-02.png'),
                _buildSlideImage('assets/images/img-03.png'),
                _buildSlideImage('assets/images/img-04.png'),
              ],
            ),
            Positioned(
              top: 80.0,
              right: 20.0,
              child: Row(
                children: [
                  ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                  },
                  child: Text('Skip'),
                ),
                ],
              ),
            ),
            Positioned(
              bottom: 150.0,
              left: 170.0,
              right: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DotsIndicator(
                    dotsCount: 3,
                    position: _currentPageIndex.toDouble(),
                    decorator: DotsDecorator(
                      color: Colors.blueGrey, // Inactive dot color
                      activeColor: Colors.white70, // Active dot color
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 60.0,
              left: 40.0,
              right: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle previous button action
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Text('Previous'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPageIndex < 2) {
                        // Handle next button action
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      }
                    },
                    child: Text(_currentPageIndex < 2 ? 'Next' : 'Sign In'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlideImage(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
