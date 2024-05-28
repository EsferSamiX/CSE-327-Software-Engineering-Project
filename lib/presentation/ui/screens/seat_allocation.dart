import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/models/trip_model.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';
import 'checkout_screen.dart';

class SeatAllocation extends StatefulWidget {
  const SeatAllocation({super.key, required this.data});
  final Data data;

  @override
  SeatAllocationState createState() => SeatAllocationState();
}

class SeatAllocationState extends State<SeatAllocation> {
  List<String> selectedSeats = [];
  MainController mainController = Get.find();

  Future<void> continueTrip() async {
    mainController.userId.value =
        mainController.userDataLocal!.data!.id.toString();
    mainController.tripId.value = widget.data.id.toString();
    mainController.seatTakenLength.value = selectedSeats.length;
    mainController.seatTaken.value = selectedSeats.toString();
    mainController.selectedPrice.value = widget.data.price;
    mainController.tripTo.value = widget.data.toLocation;
    mainController.tripFrom.value = widget.data.fromLocation;
    mainController.tripSelectedData = widget.data;
  }

  void handleSeatTap(String seatNumber) {
    setState(() {
      if (selectedSeats.contains(seatNumber)) {
        selectedSeats.remove(seatNumber);
      } else if (selectedSeats.length >= 4) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Booking Limit Reached'),
              content: const Text(
                'Sorry, you can\'t book more than 4 seats!',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        selectedSeats.add(seatNumber);
      }
    });
    debugPrint('Selected Seats: $selectedSeats');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat Seats Allocation'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                width: 350,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Selected seats: ${selectedSeats.length}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            selectedSeats.join(', '),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.p1,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 320,
                height: 530,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
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
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 210,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedSeats.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('No Seat Selected'),
                          content: const Text(
                            'Please select at least one seat to continue!',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }
                  continueTrip();
                  Get.to(() => const CheckoutScreen());
                },
                style: ButtonStyle(
                  backgroundColor: selectedSeats.isEmpty
                      ? MaterialStateProperty.all(Colors.grey)
                      : MaterialStateProperty.all(AppColors.primaryColor),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Continue Booking'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
      _buildSeatRow('I', ['I1', 'I2', 'I3', 'I4'], isWideRow: false),
    ];
  }

  Widget _buildSeatRow(String rowLabel, List<String> seatNumbers,
      {bool isWideRow = false}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 0),
            ...List.generate(seatNumbers.length, (index) {
              final seatNumber = seatNumbers[index];
              final isBooked = widget.data.seatTaken!.contains(seatNumber);
              final isSelected = selectedSeats.contains(seatNumber);

              return Row(
                children: [
                  Seat(
                    seatNumber: seatNumber,
                    isBooked: isBooked,
                    isSelected: isSelected,
                    onTap: () => handleSeatTap(seatNumber),
                  ),
                  index == 1
                      ? const SizedBox(
                          width: 40,
                        )
                      : const SizedBox(width: 0),
                  if (index < seatNumbers.length - 1)
                    SizedBox(width: isWideRow ? 2 : 5),
                ],
              );
            }),
            if (isWideRow) const SizedBox(width: 40),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class Seat extends StatelessWidget {
  final String seatNumber;
  final bool isBooked;
  final bool isSelected;
  final VoidCallback? onTap;

  const Seat({
    super.key,
    required this.seatNumber,
    this.isBooked = false,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isBooked
        ? Colors.grey
        : isSelected
            ? AppColors.primaryColor
            : Colors.white;

    return GestureDetector(
      onTap: () {
        if (isBooked) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Seat Unavailable'),
                content: const Text(
                  'Sorry, this seat is already booked!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          onTap?.call();
        }
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.green : Colors.black),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            seatNumber,
            style: TextStyle(
              color: isBooked ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
