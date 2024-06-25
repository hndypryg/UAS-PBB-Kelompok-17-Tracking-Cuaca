import 'package:flutter/material.dart';
import 'package:perfect_tracking/pages/result.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PELACAK CUACA",
          style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold), // Changed text color to light blue
        ),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
      ),
      body: Container(
        color: Colors.lightBlueAccent, // Outer background color
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            constraints: const BoxConstraints(maxWidth: 600), // Limit the max width
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildWeatherIcon(Icons.wb_sunny, 'Sunny', Colors.orange),
                      _buildWeatherIcon(Icons.cloud, 'Clouds', Colors.grey),
                      _buildWeatherIcon(Icons.grain, 'Rain', Colors.blue),
                      _buildWeatherIcon(Icons.ac_unit, 'Snow', Colors.lightBlue),
                      _buildWeatherIcon(Icons.flash_on, 'Thunderstorm', Colors.deepPurple),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukkan lokasi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                    controller: placeController,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Result(
                          place: placeController.text,
                        );
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent, // Changed button color to light blue
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("LACAK", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)), // Button text color remains white
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.lightBlueAccent, // Background color for icon circle changed to light blue
          ),
          child: CircleAvatar(
            radius: 25, // Reduced radius
            backgroundColor: color, // Icon background color restored to original color
            child: Icon(icon, size: 25, color: Colors.white), // Icon color restored to white
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12), // Icon label color
        ),
      ],
    );
  }
}
