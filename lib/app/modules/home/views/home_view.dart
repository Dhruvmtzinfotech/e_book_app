import 'package:e_book_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
    homeCon.getData();
  }
  HomeController homeCon = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Image.network(homeCon.photo.value),
              ),
              accountName: Text(homeCon.name.value),
              accountEmail: null,
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0, 2),
                        blurRadius: 5,
                        spreadRadius: 0,
                      ),
                    ],
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Text("Rate Us",textAlign: TextAlign.center,style: TextStyle(
                        color: Color(0xffC0C0C0),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      )),
                      Image.asset("assets/img/back_arrow.png"),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("HomeView"),
      ),
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      )
    );
  }
}
