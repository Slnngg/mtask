// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRScannerScreen extends StatefulWidget {
//   const QRScannerScreen({super.key});

//   @override
//   State<QRScannerScreen> createState() => _QRScannerScreenState();
// }

// class _QRScannerScreenState extends State<QRScannerScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF3062E0), // Blue background
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Camera Preview (full screen but masked)
//             QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//               overlay: QrScannerOverlayShape(
//                 borderColor: Colors.white,
//                 borderRadius: 16,
//                 borderLength: 30,
//                 borderWidth: 4,
//                 cutOutSize: 250,
//               ),
//             ),

//             // Top Back Button
//             Positioned(
//               top: 16,
//               left: 16,
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),

//             // Bottom Instructions and Controls
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 48),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Text(
//                       'Scan a QR to Pay',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       'Hold the code inside the frame,\nit will be scanned automatically',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 14,
//                       ),
//                     ),
//                     const SizedBox(height: 32),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.flash_on, color: Colors.white),
//                           onPressed: () {
//                             controller?.toggleFlash();
//                           },
//                         ),
//                         const SizedBox(width: 24),
//                         Container(
//                           height: 60,
//                           width: 60,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.white,
//                           ),
//                           child: const Icon(Icons.qr_code_scanner,
//                               color: Colors.blue),
//                         ),
//                         const SizedBox(width: 24),
//                         IconButton(
//                           icon: const Icon(Icons.cameraswitch,
//                               color: Colors.white),
//                           onPressed: () {
//                             controller?.flipCamera();
//                           },
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       // You can handle the scanned result here
//       print('Scanned: ${scanData.code}');
//     });
//   }
// }
