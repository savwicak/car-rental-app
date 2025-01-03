import 'package:flutter/material.dart';

class RentalCar extends StatelessWidget {
  const RentalCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
          Icons.arrow_back, color: Colors.black),
          onPressed: () { Navigator.pop(context);},
          ),
        actions: const [
          Icon(Icons.notifications_outlined, color: Colors.black),
          SizedBox(width: 16),
          CircleAvatar(
            backgroundImage: NetworkImage('assets/images/profile_pic.webp'),
          ),
          SizedBox(width: 16),
        ],
        title: const Text(
          "Manchester, England",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildRentedCarSection(),
            const SizedBox(height: 16),
            _buildStatsSection(),
            const SizedBox(height: 16),
            _buildRemainingDaysSection(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            children: [
              const SizedBox(width: 4),
              const Text(
                "Navigate to Rentaler",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Handle booking action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  "Navigate Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildRentedCarSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF386578),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/cars_land_rover_series_II_HD.png', 
            height: 350,
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.drive_eta, color: Colors.white),
              SizedBox(width: 8),
              Text(
                "Self-Drive",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Land Rover Series IIA",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.local_gas_station_outlined, size: 36),
                SizedBox(height: 8),
                Text("Fuel", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Last fuel filling 8 days ago",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                SizedBox(height: 8),
                Text("303 KM",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                Text(
                  "This is your last KM",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              _buildStatCard("2,343 KM", "Total Distance", Icons.speed_outlined),
              const SizedBox(height: 16),
              _buildStatCard("99°", "totala hot", Icons.wb_sunny_outlined),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF386578),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 36, color: Colors.white),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRemainingDaysSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "2D 1H",
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Remaining Days",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('Rentaler Chat', style: TextStyle(
            fontFamily: 'SuitBold', 
            fontSize: 18), 
            textAlign: TextAlign.left),
          SizedBox(height: 7),
          Row(
            children: [
              Icon(Icons.chat_bubble, color: Colors.red),
              SizedBox(width: 8),
              Text(
                "MASSSS ITU BENsin NYA SukA BEKu MAss!!!?@?!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}