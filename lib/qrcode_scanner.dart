import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({Key? key}) : super(key: key);

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  var qrcodeString = "Scan it!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              qrcodeString,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 35,
              ),
            ),
            ElevatedButton(
              onPressed: qrCodeReader,
              child: const Text(
                "Scanner",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> qrCodeReader() async {
    try {
      FlutterBarcodeScanner.scanBarcode("", "Cancel", true, ScanMode.QR)
          .then((value) {
        setState(() {
          qrcodeString = value;
        });
      });
    } catch (error) {
      setState(() {
        qrcodeString = "Unable to read Qr Code";
      });
    }
  }
}
