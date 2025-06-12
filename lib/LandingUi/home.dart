import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redbus_app/Bus/bus_home.dart';
import 'package:redbus_app/Train/train_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showLanding = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      // First time tapping Bus tab removes landing
      if (showLanding && _tabController.index == 0) {
        setState(() {
          showLanding = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 0,
        bottom: TabBar(
          
          controller: _tabController,
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          tabs: [
            Tab(
              icon: SvgPicture.asset(
                "assets/rdc-redbus-logo.svg",
                height: 30,
                width: 30,
              ),
              text: "Bus Tickets",
            ),
            Tab(
              icon: SvgPicture.asset(
                "assets/redbus-trainsvg.svg",
                height: 30,
                width: 30,
              ),
              text: "Train Tickets",
            ),
            Tab(
              icon: Icon(Icons.hotel_sharp),
              text: "Hotels",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BusTicketHomeScreen(),
          TrainHome(),
          Center(child: Text("Hotels Tickets")),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _buildLandingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 60, color: Colors.red),
          SizedBox(height: 20),
          Text(
            "Welcome to RedBus App",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text("Tap a tab to get started."),
        ],
      ),
    );
  }
}
