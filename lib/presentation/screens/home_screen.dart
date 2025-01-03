import 'package:flutter/material.dart';
import 'package:savanna_flutter_wow/data/car_data.dart';
import 'package:savanna_flutter_wow/presentation/screens/detail_cars_screen.dart';
import 'package:savanna_flutter_wow/presentation/screens/retale_car.dart';
import 'package:savanna_flutter_wow/presentation/widget/card_cars.dart';

class HomeScreen extends StatelessWidget {
  final String carName;
  const HomeScreen({super.key, required this.carName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> carsList = getCarsList(carName);

    Widget nameLocation() {
      return const Text(
        "Manchester, England",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'SuitBold',
        ),
      );
    }

    Widget rentedCar() {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF606C38),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/cars_land_rover_series_II_HD.png',
              width: 150,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Rented Car",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SuitRegular',
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Land Rover Series IIA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SuitBold',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RentalCar(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      "See details",
                      style: TextStyle(fontFamily: 'SuitRegular'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget discoverMore() {
      return const Text(
        "Discover More",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'SuitBold',
        ),
      );
    }

    Widget searchAndFilter() {
      return Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search cool cars...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      );
    }

    Widget categoryCards() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryCard("Land Rover"),
            _buildCategoryCard("Range Rover"),
            _buildCategoryCard("Jeep"),
            _buildCategoryCard("Land Cruiser"),
            _buildCategoryCard("Ferrari"),
            _buildCategoryCard("Tesla"),
          ],
        ),
      );
    }
    Widget carCards() {
      return Column(
        children: List.generate(carsList.length, (index) {
          var car = carsList[index];
          return Row(
            children: [
              Expanded(
                child: CardCars(
                  name: car['name']!, // car name from the list
                  location: car['location']!,
                  seats: car['seats']!,
                  speed: car['speed']!,
                  image: car['image']!,
                  ontap: () {
                    // Corrected navigation
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCarsScreen(
                          image: car['image']!,
                          title: car['name']!,
                          campingKit: car['campingKit']!,  // Replace with actual data key
                          seats: car['seats']!,
                          kmh: car['speed']!,
                          drive: car['drive']!,  // Add other necessary fields
                          price: car['price']!,  // Replace with actual key from your data
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10, height: 30,),
            ],
          );
        }),
      );
    }



    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vas Happenin, Freddie",
          style: TextStyle(fontFamily: 'SuitBold'),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          const CircleAvatar(
            backgroundImage: NetworkImage('assets/images/profile_pic.webp'),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // To enable vertical scrolling
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nameLocation(),
              const SizedBox(height: 20),
              rentedCar(),
              const SizedBox(height: 20),
              discoverMore(),
              const SizedBox(height: 10),
              searchAndFilter(),
              const SizedBox(height: 20),
              categoryCards(),
              const SizedBox(height: 20),
              carCards(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(title),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
