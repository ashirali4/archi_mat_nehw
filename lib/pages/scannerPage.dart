// import 'dart:io';

// import 'package:archi_mat/Services/fallowService.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// import '../environment.dart';

// // import 'package:firebase_admob/firebase_admob.dart';
// import 'package:flutter/material.dart';
// // import 'package:easy_localization/easy_localization.dart';

// import 'package:vibration/vibration.dart';

// import '../theme.dart';

// class ShopQr extends StatefulWidget {
//   const ShopQr({
//     Key key,
//   }) : super(key: key);
//   @override
//   State<StatefulWidget> createState() => _ShopQrState();
// }

// class _ShopQrState extends State<ShopQr> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode result;
//   QRViewController controller;

//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller.resumeCamera();
//     }
//   }

//   getHomeData() {
//     setState(() {
//       // this.loading = true;
//     });
//     // Storage.getUser().then((i) {
//     //   setState(() {
//     //     userId = i['_id'];
//     //   });
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.purple,
//         child: SvgPicture.asset(
//           'assets/images/floatlogo.svg',
//           width: 20,
//           color: AppTheme().white,
//         ),
//         onPressed: () {},
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width * 0.8,
//             height: 200,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Text("Its the best way to grow your ",
//               style: TextStyle(color: Colors.black, fontSize: 20)),
//           Text("follower and reach more buyers. ",
//               style: TextStyle(color: Colors.black, fontSize: 20)),
//         ],
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) async {
//       setState(() {
//         result = scanData;
//       });
//       if (controller != '') {
//         controller.pauseCamera();
//         FallowService().fallow(controller).then((data) {
//           print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
//           print(data);
//           if (data['message'] == 'success') {
//             // Toast.show('Voucher Successfully Use', context, duration: 4);
//           } else if (data['message'] == 'Already Use') {
//             // Toast.show('Already Use', context, duration: 4);
//           } else if (data['message'] == 'fail') {
//             // Toast.show('Expired', context, duration: 4);
//           } else {
//             // Toast.show("Wrong QR, Try Again", context,
//             //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//           }
//           controller.resumeCamera();
//         });

//         // var shopId = link.queryParameters["shop"];

//       } else {
//         if (await Vibration.hasVibrator()) {
//           Vibration.vibrate();
//         }
//         // Toast.show("Wrong QR, Try Again", context,
//         //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//         this.controller.resumeCamera();
//       }
//       // qrText = controller;
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
