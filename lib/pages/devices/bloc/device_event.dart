part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class SelectMenuItemEvent extends DeviceEvent {
  final int index;

  const SelectMenuItemEvent(this.index);
}

class SelectDropdownItemEvent extends DeviceEvent {
  final String item;

  SelectDropdownItemEvent(this.item);
}

class ChangeColor extends DeviceEvent {
  bool isChanged;

  ChangeColor(this.isChanged);
}

class DetermineTheSize extends DeviceEvent {
  double direction;

  DetermineTheSize(this.direction);
}

class UpdateTheWidth extends DeviceEvent {
  double width;
  double screenWidth;

  UpdateTheWidth(this.width, this.screenWidth);
}

class ChangeSlideColor extends DeviceEvent {

  ChangeSlideColor();
}
