import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveller/components/hotel_carousel.dart';
import 'package:traveller/main.dart';

import '../components/destination_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];
  int selectedIndex = 0;
  int currentTab = 0;
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: index == selectedIndex ? accentColor : lightGreyColor,
        child: Icon(
          icons[index],
          size: 25,
          color: index == selectedIndex ? primaryColor : greyColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          primary: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 30),
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                "What would you like to find?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  List.generate(icons.length, (index) => _buildIcon(index)),
            ),
            const SizedBox(
              height: 20,
            ),
            const DestinationCarousel(),
            const SizedBox(
              height: 20,
            ),
            const HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentTab,
          onTap: (tab) {
            setState(() {
              currentTab = tab;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30,
              ),
              label: "Pizza",
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/crotia.jpg"),
              ),
              label: "Profile",
            ),
          ]),
    );
  }
}
