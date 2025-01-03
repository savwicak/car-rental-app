import 'package:flutter/material.dart';

class CardCars extends StatelessWidget {
  final String name;
  final String location;
  final String seats;
  final String speed;
  final String image;
  final Function ontap;

  const CardCars({
    required this.name,
    required this.location,
    required this.seats,
    required this.speed,
    required this.image,
    required this.ontap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () => ontap(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    image, 
                    height: 200,
                    width: 320,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  name, 
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location, 
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.airline_seat_recline_extra, size: 16),
                        const SizedBox(width: 5),
                        Text("$seats Seats"),

                        const SizedBox(width: 12),

                        const Icon(Icons.speed, size: 16),
                        const SizedBox(width: 5),
                        Text("$speed Mph"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
        );
    }
}