import 'package:flutter/material.dart';
import 'package:trads_app/pages/NextPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _slides = [
    {
      "image": "images/image1.PNG",
      "text": "Create Invoices \n Faster and Easier"
    },
    {
      "image": "images/image2.png",
      "text": "Gérez vos factures facilement."
    },
    {
      "image": "images/image3.png",
      "text": "Une solution rapide et efficace."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF07313A),
      body: SafeArea(
        child: Column(
          children: [
            // Logo et titre
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logo.PNG',
                    height: 40,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Trands.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Slider d'images et textes
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _slides[index]["image"]!,
                        height: 300,
                      ),
                      SizedBox(height: 16),
                      Text(
                        _slides[index]["text"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Simply billing invoices. Throughout on automated \n payment system. Payments will be faster and \n easier to collect",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Indicateurs de slider et bouton
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Indicateurs de slider
                  Row(
                    children: List.generate(
                      _slides.length,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentIndex == index ? 20 : 12,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? Color(0xFF2CD196)
                              : Colors.grey[600],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  // Bouton suivant
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2CD196),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Coins arrondis
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4), // Dimensions du bouton
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NextPage()),
                      );
                    },
                    child: Icon(
                      Icons.chevron_right, // Icône >
                      color: Colors.white,
                      size: 24,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
