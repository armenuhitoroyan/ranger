part of 'device_bloc.dart';

class DeviceState extends Equatable {
  final int selectedIndex;

  String? dropdownvalue;
  bool onOff;
  double index;
  bool isStarted;
  double width;
  double screenWidth;
  double percent;

  DeviceState(
      {this.selectedIndex = 0,

      this.dropdownvalue,
      this.onOff = false,
      this.index = 0,
      this.isStarted = false,
      this.width = 0,
      this.screenWidth = 0,
      this.percent = 0});

  DeviceState copyWith({
    int? selectedIndex,
    String? dropdownvalue,
    bool? onOff,
    double? index,
    bool? isStarted,
    double? width,
    double? screenWidth,
    double? percent,
  }) {
    return DeviceState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        dropdownvalue: dropdownvalue ?? this.dropdownvalue,
        onOff: onOff ?? this.onOff,
        index: index ?? this.index,
        isStarted: isStarted ?? this.isStarted,
        width: width ?? this.width,
        screenWidth: screenWidth ?? this.screenWidth,
        percent: percent ?? this.percent);
  }

  @override
  List<Object> get props =>
      [selectedIndex, onOff, index, isStarted, width, screenWidth, percent];
}
