import 'package:flutter/material.dart';

List<String> selectedSeats = []; // Populate this list as per your logic
List<String> bookedSeats = []; // Populate this list from the API response

void handleSeatTap(String seatNumber) {
  // Implement your seat tap logic here
}

class Seat extends StatelessWidget {
  final String seatNumber;
  final bool isBooked;
  final bool isSelected;
  final VoidCallback onTap;

  const Seat({
    required this.seatNumber,
    this.isBooked = false,
    this.isSelected = false,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isBooked ? null : onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isBooked
              ? Colors.red
              : isSelected
                  ? Colors.green
                  : Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(seatNumber),
        ),
      ),
    );
  }
}

class SeatLayout extends StatelessWidget {
  final List<String> selectedSeats;
  final List<String> bookedSeats;

  const SeatLayout({
    required this.selectedSeats,
    required this.bookedSeats,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(width: 175),
            Icon(Icons.airline_seat_recline_extra, size: 32),
          ],
        ),
        const SizedBox(height: 10),
        ..._buildSeatRows(),
      ],
    );
  }

  List<Widget> _buildSeatRows() {
    return [
      _buildSeatRow('A', ['A1', 'A2', 'A3', 'A4']),
      _buildSeatRow('B', ['B1', 'B2', 'B3', 'B4']),
      _buildSeatRow('C', ['C1', 'C2', 'C3', 'C4']),
      _buildSeatRow('D', ['D1', 'D2', 'D3', 'D4']),
      _buildSeatRow('E', ['E1', 'E2', 'E3', 'E4']),
      _buildSeatRow('F', ['F1', 'F2', 'F3', 'F4']),
      _buildSeatRow('G', ['G1', 'G2', 'G3', 'G4']),
      _buildSeatRow('H', ['H1', 'H2', 'H3', 'H4']),
      _buildSeatRow('I', ['I1', 'I2', 'I3', 'I4', 'I5'], isWideRow: true),
    ];
  }

  Widget _buildSeatRow(String rowLabel, List<String> seatNumbers,
      {bool isWideRow = false}) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            ...List.generate(seatNumbers.length, (index) {
              return Row(
                children: [
                  Seat(
                    seatNumber: seatNumbers[index],
                    isBooked: bookedSeats.contains(seatNumbers[index]),
                    isSelected: selectedSeats.contains(seatNumbers[index]),
                    onTap: () => handleSeatTap(seatNumbers[index]),
                  ),
                  if (index < seatNumbers.length - 1)
                    SizedBox(width: isWideRow ? 2 : 5),
                ],
              );
            }),
            if (!isWideRow) const SizedBox(width: 40),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

void main() {
  // Example of how to populate bookedSeats from API response
  final apiResponse = {
    "seatTaken":
        "C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, E2, D4, C1, D1, F1, C1, D1, C1, C1, C1, E4"
  };
  bookedSeats = apiResponse['seatTaken']!.split(', ').toList();

  runApp(MaterialApp(
    home: Scaffold(
      body: SeatLayout(
        selectedSeats: selectedSeats,
        bookedSeats: bookedSeats,
      ),
    ),
  ));
}
