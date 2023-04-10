import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

String data = '';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc() : super(ScannerState()) {
    on<ScanEvent>(_onScanEvent);
  }

  _onScanEvent(ScanEvent event, Emitter<ScannerState> emit) async {
    final scanResult = await FlutterBarcodeScanner.scanBarcode(
      '#000000',
      'Cansel',
      true,
      ScanMode.BARCODE,
    );

    emit(state.copyWith(data: scanResult));
  }
}
