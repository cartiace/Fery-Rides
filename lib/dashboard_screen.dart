import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example ride data with more detailed information
    final rides = [
      {
        'title': 'Fery Ride #1',
        'details': 'Departure: 10:00 AM, Arrival: 12:00 PM',
        'price': '₹3500',
        'destination': 'Mumbai, Maharashtra',
        'feryName': 'Fery A',
        'feryNumber': '12345',
        'contactDetails': '+91 98765 43210',
      },
      {
        'title': 'Fery Ride #2',
        'details': 'Departure: 1:00 PM, Arrival: 3:00 PM',
        'price': '₹2500',
        'destination': 'Chennai, Tamil Nadu',
        'feryName': 'Fery B',
        'feryNumber': '23456',
        'contactDetails': '+91 81234 56789',
      },
      {
        'title': 'Fery Ride #3',
        'details': 'Departure: 4:00 PM, Arrival: 6:00 PM',
        'price': '₹4000',
        'destination': 'Kolkata, West Bengal',
        'feryName': 'Fery C',
        'feryNumber': '34567',
        'contactDetails': '+91 90000 11223',
      },
      {
        'title': 'Fery Ride #4',
        'details': 'Departure: 7:00 PM, Arrival: 9:00 PM',
        'price': '₹3500',
        'destination': 'Goa',
        'feryName': 'Fery D',
        'feryNumber': '45678',
        'contactDetails': '+91 88001 23456',
      },
      {
        'title': 'Fery Ride #5',
        'details': 'Departure: 10:00 PM, Arrival: 12:00 AM',
        'price': '₹3000',
        'destination': 'Kochi, Kerala',
        'feryName': 'Fery E',
        'feryNumber': '56789',
        'contactDetails': '+91 99456 78901',
      },
    ];


    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE75480), // Softer pink
              Color(0xFF4B0082), // Dark purple
              Colors.black,      // Solid black
            ],
            stops: [0.0, 0.3, 1.0], // Pink dominates top-left, black dominates bottom-right
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.black.withOpacity(0.7),
              elevation: 0,
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.webp',
                    height: 30,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Fery Rides',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: rides.length,
                itemBuilder: (context, index) {
                  final ride = rides[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.grey[900],
                    child: Column(
                      children: [
                        // Row with Info Icon on the Left and "Book" Button on the Right
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Info Icon on the Left
                              GestureDetector(
                                onTap: () {
                                  // Navigate to ride details with more information
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RideDetailsScreen(
                                        rideTitle: ride['title']!,
                                        rideDetails: ride['details']!,
                                        rideDestination: ride['destination']!,
                                        ridePrice: ride['price']!,
                                        ferName: ride['feryName']!,
                                        ferNumber: ride['feryNumber']!,
                                        contactDetails: ride['contactDetails']!,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      ride['title']!,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),

                              // "Book" Button on the Right
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookingConfirmationScreen(
                                        rideTitle: ride['title']!,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pinkAccent,
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  'Book',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Ride details
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Destination and Price
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Destination: ${ride['destination']}',
                                    style: const TextStyle(color: Colors.white70),
                                  ),
                                  Text(
                                    'Price: ${ride['price']}',
                                    style: const TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Ride details (previous)
                              Text(
                                ride['details']!,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              // Adding space between the text and the bottom of the card
                              const SizedBox(height: 16), // Adjust this value for the desired space
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RideDetailsScreen extends StatelessWidget {
  final String rideTitle;
  final String rideDetails;
  final String rideDestination;
  final String ridePrice;
  final String ferName;
  final String ferNumber;
  final String contactDetails;

  const RideDetailsScreen({
    Key? key,
    required this.rideTitle,
    required this.rideDetails,
    required this.rideDestination,
    required this.ridePrice,
    required this.ferName,
    required this.ferNumber,
    required this.contactDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(rideTitle),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rideTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Destination: $rideDestination',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: $ridePrice',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              rideDetails,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Additional Ride Information
            Text(
              'Fery Name: $ferName',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Fery Number: $ferNumber',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Contact: $contactDetails',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingConfirmationScreen extends StatelessWidget {
  final String rideTitle;

  const BookingConfirmationScreen({Key? key, required this.rideTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'You have successfully booked $rideTitle!',
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
