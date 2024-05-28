import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/constants.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/models/trip_model.dart';
import 'package:relax_ride/presentation/ui/screens/seat_allocation.dart';
import 'package:http/http.dart' as http;

import '../utility/app_colors.dart';
//import '../utility/assets_path.dart';

class AvailableTrips extends StatefulWidget {
  const AvailableTrips(
      {super.key, required this.selectedData, this.from, this.to});
  final String? selectedData;
  final String? from;
  final String? to;

  @override
  State<AvailableTrips> createState() => _AvailableTripsState();
}

class _AvailableTripsState extends State<AvailableTrips> {
  bool stateLoading = true;
  TripModel? tripResponseData;
  @override
  void initState() {
    super.initState();
    getTrip();
  }

  Future<void> getTrip() async {
    try {
      final response = await http.post(
        Uri.parse('$uri/tripsFrom'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'toLocation': widget.to ?? 'Dhaka',
          'fromLocation': widget.from ?? 'Chittagong',
          'date': widget.selectedData ?? '2022-12-12',
        }),
      );

      if (response.statusCode == 200) {
        MainController mainController = Get.find();
        mainController.selectedDate.value = widget.selectedData!;
        tripResponseData = TripModel.fromJson(jsonDecode(response.body));
        debugPrint('Trip fetched successfully');
        Future.delayed(const Duration(milliseconds: 600), () {
          setState(() {});
        });
      } else if (response.statusCode == 409) {
        // User already registered
        Get.snackbar('Error', 'User/Phone number already exists');
        debugPrint('Phone number already exists');
      } else {
        // Handle other status codes if needed
        Get.snackbar('Error', 'Error occurred during trip');
        debugPrint('Unexpected status code: ${response.statusCode}');
      }
      stateLoading = false;
    } catch (e) {
      Get.snackbar('Error', 'Error occurred during trip');
      // Handle error
      debugPrint('Error occurred during fetching trip: $e');
      stateLoading = false;
    }
    stateLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Trips'),
      ),
      body: stateLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: tripResponseData?.data.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Trips(data: tripResponseData!.data[index]),
                );
              },
            ),
    );
  }
}

class Trips extends StatelessWidget {
  const Trips({
    super.key,
    required this.data,
  });
  final Data data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (data.seatsAvailable == null || data.seatsAvailable! < 1) {
          Get.snackbar('Sorry!', 'No seats available');
          return;
        }
        Get.to(() => SeatAllocation(data: data));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.p1,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //SizedBox(width: 100),
                ],
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(data.departTime.toString()),
                      const SizedBox(width: 100),
                      Text(
                        '৳${data.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Hino 1J Series, AC'),
                      const SizedBox(
                        width: 68,
                      ),
                      Text(
                        'Total: ${data.seats}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Available Seats : ${data.seatsAvailable.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 136, 113),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
