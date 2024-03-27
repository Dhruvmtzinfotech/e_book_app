import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_book_app/app/modules/books/views/books_view.dart';
import 'package:e_book_app/app/modules/home/controllers/home_controller.dart';
import 'package:e_book_app/app/modules/video/views/video_view.dart';
import 'package:e_book_app/utils/responsive.dart';
import 'package:e_book_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _currentPosition = 0; // DotsIndicator


  @override
  void initState() {
    super.initState();
    homeCon.getData();
  }

  HomeController homeCon = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("HomeView"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 200.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 700),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index,reason){
                      setState(() {
                        _currentPosition = index;
                      });
                    }
                ),
                items: [
                  Container(
                    child: Center(
                      child: Image.asset("assets/img/city.webp"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Image.asset("assets/img/Home.jpg"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Image.asset("assets/img/Codingimage.jpg"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Image.asset("assets/img/city.webp"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Image.asset("assets/img/Home.jpg"),
                    ),
                  ),
                ],
              ),
              DotsIndicator(
                dotsCount: 5,
                position: _currentPosition.toDouble(),
                decorator: DotsDecorator(
                  color: Colors.black,
                    spacing: const EdgeInsets.all(10.0),
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width_45,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => BooksView());
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset("assets/img/ornaments.jpg"),
                              Image.asset("assets/icons/book.png", height: height_6),
                              Positioned(
                                bottom: 28,
                                child: Text('Books',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width_1),
                    Container(
                      width: width_45,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(() => VideoView());
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset("assets/img/ornaments.jpg"),
                              Image.asset("assets/icons/video.png", height: height_6),
                              Positioned(
                                bottom: 28,
                                child: Text('Videos',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width_45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset("assets/img/ornaments.jpg"),
                            Image.asset("assets/icons/coming-soon.png", height: height_6),
                            Positioned(
                              bottom: 28,
                              child: Text('Coming Soon',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: width_1),
                    Container(
                      width: width_45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset("assets/img/ornaments.jpg"),
                            Image.asset("assets/icons/coming-soon.png", height: height_6),
                            Positioned(
                              bottom: 28,
                              child: Text('Coming Soon',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
