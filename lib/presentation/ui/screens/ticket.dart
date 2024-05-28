import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter/services.dart' show rootBundle;

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: TicketWidget(
              width: 350,
              height: 500,
              isCornerRounded: true,
              padding: EdgeInsets.all(20),
              child: TicketData(),
            ),
          ),
          const SizedBox(height: 20),
          const Column(
            children: [
              SizedBox(height: 20),
            ],
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                await generatePdf(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.purple,
                backgroundColor: Colors.white,
              ),
              child: const Text('Download Ticket'),
            ),
          ),
        ],
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(width: 1.0, color: Colors.green),
                ),
                child: const Center(
                  child: Text(
                    'Business Class',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    mainController.tripFrom.toString(),
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.directions_bus,
                      color: Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      mainController.tripTo.toString(),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              '  Bus  Ticket',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, right: 11.0),
                  child: ticketDetailsWidget(
                    'Passengers',
                    "${mainController.userData.data!.fname} ${mainController.userData.data!.lname}",
                    'Date',
                    mainController.tripSelectedData!.date
                        .toString()
                        .split('00:')[0],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 12.0, right: 1.0),
                    child: ticketDetailsWidget(
                      'Trip',
                      mainController.tripSelectedData!.id.toString(),
                      'Seat number',
                      mainController.seatTaken
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', ''),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 11.0),
                  child: ticketDetailsWidget('Class', 'Business', 'Total seats',
                      mainController.seatTakenLength.toString()),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/barcode1.png',
                height: 150,
                width: 230,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}

Future<void> generatePdf(BuildContext context) async {
  final pdf = pw.Document();
  MainController mainController = Get.find();

  // Load the image
  final ByteData imageData =
      await rootBundle.load('assets/images/barcode1.png');
  final Uint8List imageBytes = imageData.buffer.asUint8List();

  // Add content to the PDF
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Container(
                    width: 120.0,
                    height: 25.0,
                    decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(30.0),
                      border: pw.Border.all(width: 1.0, color: PdfColors.green),
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        'Business Class',
                        style: const pw.TextStyle(color: PdfColors.green),
                      ),
                    ),
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        mainController.tripFrom.toString(),
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(left: 8.0),
                        child: pw.Text(
                          mainController.tripTo.toString(),
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: 20.0),
                child: pw.Text(
                  '  Bus  Ticket',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 20.0,
                      fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: 25.0),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(top: 1.0, right: 11.0),
                      child: pwticketDetailsWidget(
                        'Passengers',
                        "${mainController.userData.data!.fname} ${mainController.userData.data!.lname}",
                        'Date',
                        mainController.tripSelectedData!.date
                            .toString()
                            .split('00:')[0],
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(top: 12.0, right: 1.0),
                      child: pwticketDetailsWidget(
                        'Trip',
                        mainController.tripSelectedData!.id.toString(),
                        'Seat number',
                        mainController.seatTaken
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(top: 12.0, right: 11.0),
                      child: pwticketDetailsWidget(
                        'Class',
                        'Business',
                        'Total seats',
                        mainController.seatTakenLength.toString(),
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 30),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Image(
                    pw.MemoryImage(imageBytes),
                    height: 150,
                    width: 230,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );

  // Save the PDF to a file
  final File file;
  final output = await getTemporaryDirectory();
  file = File('${output.path}/ticket_data.pdf');
  try {
    await file.writeAsBytes(await pdf.save());
  } catch (e) {
    // Handle error
    debugPrint('Error occurred during PDF generation: $e');
  } finally {
    // Open the PDF in the viewer
    Get.snackbar("Ticket Saved!", "Ticket saved successfully");
    OpenFile.open(file.path);
  }

  // Open PDF file
  // OpenFile.open(file.path);
}

pw.Widget pwticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Padding(
        padding: const pw.EdgeInsets.only(left: 12.0),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: <pw.Widget>[
            pw.Text(
              firstTitle,
              style: const pw.TextStyle(color: PdfColors.grey),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 4.0),
              child: pw.Text(
                firstDesc,
                style: const pw.TextStyle(color: PdfColors.black),
              ),
            )
          ],
        ),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.only(right: 20.0),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              secondTitle,
              style: const pw.TextStyle(color: PdfColors.grey),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 4.0),
              child: pw.Text(
                secondDesc,
                style: const pw.TextStyle(color: PdfColors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
