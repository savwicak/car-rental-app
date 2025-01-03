import 'package:flutter/material.dart';

class DetailCarsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String campingKit;
  final String seats;
  final String kmh;
  final String drive;
  final String price;
  const DetailCarsScreen({
    required this.image,
    required this.title,
    required this.campingKit,
    required this.seats,
    required this.kmh,
    required this.drive,
    required this.price,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Car Image Section
            Stack(
              children: [
                Container(
                  color: Colors.orange[200], // Background color
                  height: 520,
                  child: Center(
                    child: Image.network(
                      image, 
                      height: 390,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: Chip(
                    label: Text(drive,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),

            // Title and Rating Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8), // Spacing after the title

                  // Camping Kit Information
                  Text(
                    campingKit,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16), // Spacing after the camping kit info

                  // Container for the Row content (User Info, Rating, and Link)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100], // Light background color
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                    padding: const EdgeInsets.all(12), // Inner padding
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Profile Picture
                        const CircleAvatar(
                          radius: 24, // Adjust the size as needed
                          backgroundImage: AssetImage('assets/images/profile_pic_rentaler.png'),
                        ),
                        const SizedBox(width: 12), // Spacing between avatar and text

                        // User Info and Rating
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // User Name
                              Text(
                                "soepir bis handal",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4), // Spacing between name and rating

                              // Rating and Reviews
                              Row(
                                children:[
                                  Icon(Icons.star, size: 16, color: Colors.amber), // Star icon
                                  SizedBox(width: 4), // Spacing between star and rating
                                  Text(
                                    "5.0",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 8), // Spacing between rating and reviews
                                  Text(
                                    "14 Reviews",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Rental Rules >",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            // Specifications Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Specifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SpecItem(icon: Icons.chair, label: "Seats", value: seats),
                      SpecItem(
                          icon: Icons.speed, label: "0 - 100 km/h", value: kmh),
                      SpecItem(icon: Icons.drive_eta, label: "Drive", value: drive),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            children: [
              Text(
                "From",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(width: 4),
              Text(
                "\$ $price / day",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  "Book Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

class SpecItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const SpecItem({
    required this.icon, 
    required this.label, 
    required this.value,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.black),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
      
    );
  }
}