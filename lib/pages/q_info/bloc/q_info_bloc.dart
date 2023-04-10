import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ranger/base/regexp.dart';

import '../../../config/str.dart';

part 'q_info_event.dart';
part 'q_info_state.dart';

bool isValid = true;
bool isValidAddress = false;
bool isValidPinCode = false;

class QrInfoBloc extends Bloc<QInfoEvent, QInfoValidState> with RangerTexts {
  String message = '';
  String addressErrorMessage = '';
  String pincodeErrorMessage = '';

  QrInfoBloc() : super(QInfoValidState()) {
    on<QInfoTextChangedEvent>(_onValidate);
  }

  _onValidate(QInfoTextChangedEvent event, Emitter<QInfoValidState> emit) {
    final regExpAdd = RegExp(RegularExpressions.address);
    final regExpPin = RegExp(RegularExpressions.pinCode);

    if (event.addressValue.isEmpty && event.pinCodeValue.isEmpty) {
      isValid = false;
      addressErrorMessage = '';
      pincodeErrorMessage = '';
      message = super.errorMessage;
    } else if (event.addressValue.length != 13 ||
        (regExpAdd.hasMatch(event.addressValue) == false)) {
      isValid = false;

      message = '';
      addressErrorMessage = super.emailErr;
      pincodeErrorMessage = '';
      isValidAddress = true;
    } else if (event.pinCodeValue.length != 10 ||
        (regExpPin.hasMatch(event.pinCodeValue) == false)) {
      isValid = false;

      addressErrorMessage = '';
      message = '';
      pincodeErrorMessage = super.pinCodeError;
      isValidPinCode = true;
    } else {
      isValid = true;
      addressErrorMessage = '';
      message = '';
      isValidAddress = false;
      isValidPinCode = false;
    }

    emit(
      state.copyWith(
        isValid: isValid,
        errorAddress: addressErrorMessage,
        errorMessage: message,
        errorPin: pincodeErrorMessage,
        isValidAddress: isValidAddress,
        isValidPinCode: isValidPinCode,
      ),
    );

  }
}
