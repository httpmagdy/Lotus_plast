import 'package:barcode_scan/barcode_scan.dart';
import 'package:get/get.dart';

class QrProvider extends GetxController {
  // @override
  // void onInit() {
  //   scanQR() ;    super.onInit();
  // }
  var _scanQrCode;
  get scanQrCode => this._scanQrCode;

  Future<void> scanQR() async {
    await BarcodeScanner.scan().then((value) {
      print('_scanQrCode :::::::: ${value.rawContent}');
      _scanQrCode = value.rawContent;
      update();
    });
  }
}

//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // try {
//     //   barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//     //       "#ff6666", "Cancel", true, ScanMode.QR);
//     //   print(barcodeScanRes);
//     // } on PlatformException {
//     //   barcodeScanRes = 'Failed to get platform version.';
//     // }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     // if (!mounted) return;
//
//     _scanQrCode.value = barcodeScanRes;
//   }
// }
