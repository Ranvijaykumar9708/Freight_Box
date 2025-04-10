import 'package:flutter/material.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  List<Map<String, dynamic>> freightBookings = [
    {
      'name': 'Electronics from Mumbai to Dubai',
      'date': 'April 20, 2025',
      'status': 'Booked',
    },
    {
      'name': 'Furniture from Chennai to Singapore',
      'date': 'April 25, 2025',
      'status': 'Pending',
    },
    {
      'name': 'Textiles from Surat to London',
      'date': 'April 28, 2025',
      'status': 'Confirmed',
    },
    {
      'name': 'Automobile parts from Pune to Hamburg',
      'date': 'May 2, 2025',
      'status': 'Booked',
    },
    {
      'name': 'Pharmaceuticals from Hyderabad to New York',
      'date': 'May 5, 2025',
      'status': 'Pending',
    },
    {
      'name': 'Spices from Kochi to Amsterdam',
      'date': 'May 8, 2025',
      'status': 'Confirmed',
    },
    {
      'name': 'Garments from Tirupur to Paris',
      'date': 'May 10, 2025',
      'status': 'Booked',
    },
  ];

  void _cancelBooking(int index) {
    setState(() {
      freightBookings.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Freight booking cancelled')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freight Bookings'),
      ),
      body: freightBookings.isEmpty
          ? const Center(child: Text('No freight bookings available'))
          : ListView.builder(
              itemCount: freightBookings.length,
              itemBuilder: (context, index) {
                final booking = freightBookings[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.local_shipping),
                    title: Text(booking['name']),
                    subtitle: Text('Date: ${booking['date']}'),
                    trailing: SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            booking['status'],
                            style: TextStyle(
                              color: booking['status'] == 'Booked'
                                  ? Colors.green
                                  : Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () => _cancelBooking(index),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(40, 20),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
