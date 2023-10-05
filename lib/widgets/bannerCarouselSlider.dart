// ignore_for_file: camel_case_types
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class bannerCarouselSlider extends StatefulWidget {
  const bannerCarouselSlider({super.key});

  @override
  State<bannerCarouselSlider> createState() {
    return _bannerCarouselSlider();
  }
}

class _bannerCarouselSlider extends State<bannerCarouselSlider> {
  int _activeBanner = 0;
  var pageController = PageController(viewportFraction: 0.9, initialPage: 0);
  List<String> BannerData = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  getImages() async {
    for (int i = 1; i < 4; i++) {
      var ref = FirebaseStorage.instance
          .ref()
          .child('BannerImages')
          .child('${i}.jpg');
      _loading = true;
      var urll = await ref.getDownloadURL();
      print(1);
      print(urll);
      BannerData.add(urll);
    }
    if (BannerData.isNotEmpty) {
      setState(() {
        _loading = false;
      });
      return;
    }
  }

  List<Widget> carouselIndicator(List<String> BannerData) {
    return List<Widget>.generate(BannerData.length, (index) {
      return Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                _activeBanner == index ? Colors.black : Colors.grey.shade400),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget content = const Center(
      child: Text("Error"),
    );
    if (_loading) {
      content = Center(
        child: CircularProgressIndicator(),
      );
    }

    if (BannerData.isNotEmpty) {
      content = Container(
          height: 200,
          child: Stack(alignment: Alignment.center, children: [
            PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                return AnimatedOpacity(
                  opacity: _activeBanner == index % BannerData.length ? 1 : 0.8,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                    width: width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          BannerData[index % BannerData.length],
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
              pageSnapping: true,
              onPageChanged: (index) {
                setState(() {
                  _activeBanner = index % BannerData.length;
                });
              },
              scrollDirection: Axis.horizontal,
            ),
            Positioned(
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(69, 0, 0, 0),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    children: [...carouselIndicator(BannerData)],
                  ),
                ))
          ]));
    }
    return content;
  }
}
