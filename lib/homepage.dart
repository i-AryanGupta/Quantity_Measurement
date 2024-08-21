import 'package:flutter/material.dart';
import 'package:quantity_measurement/length.dart';
import 'package:quantity_measurement/my_header_drawer.dart';
import 'package:quantity_measurement/volume.dart';
import 'package:quantity_measurement/weight.dart';
import 'package:quantity_measurement/speed.dart';
import 'package:quantity_measurement/temperature.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var currentPage = DrawerSections.Temperature;
 
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.Temperature) {
      container = const TemperaturePage();
    } else if (currentPage == DrawerSections.Length) {
      container = const LengthPage();
    } else if (currentPage == DrawerSections.Weight) {
      container = const WeightPage();
    } else if (currentPage == DrawerSections.Volume) {
      container = const VolumePage();
    } else if (currentPage == DrawerSections.Speed) {
      container = const SpeedPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Unit Conversion"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        )),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItems(1, "Temperature",
              currentPage == DrawerSections.Temperature ? true : false),
          menuItems(
              2, "Length", currentPage == DrawerSections.Length ? true : false),
          menuItems(
              3, "Weight", currentPage == DrawerSections.Weight ? true : false),
          menuItems(
              4, "Volume", currentPage == DrawerSections.Volume ? true : false),
          menuItems(
              5, "Speed", currentPage == DrawerSections.Speed ? true : false),
        ],
      ),
    );
  }

  Widget menuItems(int id, String title, bool selected) {
    return Material(
      color: selected ? Colors.blue : Colors.transparent,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                currentPage = DrawerSections.Temperature;
              } else if (id == 2) {
                currentPage = DrawerSections.Length;
              } else if (id == 3) {
                currentPage = DrawerSections.Weight;
              } else if (id == 4) {
                currentPage = DrawerSections.Volume;
              } else if (id == 5) {
                currentPage = DrawerSections.Speed;
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

enum DrawerSections {
  Temperature,
  Length,
  Weight,
  Volume,
  Speed,
}