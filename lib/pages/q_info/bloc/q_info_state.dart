part of 'q_info_bloc.dart';

class QInfoValidState extends Equatable {
  final bool? loading;
  final bool isValid;
  final bool isValidAddress; 
  final bool isValidPinCode;
  final String? errorMessage;
  final String? errorAddress;
  final String? errorPin;

  QInfoValidState(
      {this.loading,
      this.isValid = false,
      this.isValidAddress = false,
      this.isValidPinCode = false,
      this.errorMessage,
      this.errorAddress,
      this.errorPin});

  QInfoValidState copyWith({
    bool? loading,
    bool? isValid,
    bool? isValidAddress,
    bool? isValidPinCode,
    String? errorMessage,
    String? errorAddress,
    String? errorPin,
  }) {
    return QInfoValidState(
        loading: loading ?? this.loading,
        isValid: isValid ?? this.isValid,
        isValidAddress: isValidAddress ?? this.isValidAddress,
        isValidPinCode: isValidPinCode ?? this.isValidPinCode,
        errorMessage: errorMessage ?? this.errorMessage,
        errorAddress: errorAddress ?? this.errorAddress,
        errorPin: errorPin ?? this.errorPin);
  }

  @override
  List<Object> get props => [isValid, isValidAddress, isValidPinCode];
}
