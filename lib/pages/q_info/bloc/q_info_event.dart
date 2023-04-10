part of 'q_info_bloc.dart';

abstract class QInfoEvent extends Equatable {
  const QInfoEvent();

  @override
  List<Object> get props => [];
}

class QInfoTextChangedEvent extends QInfoEvent {
  final String addressValue;
  final String pinCodeValue;

  QInfoTextChangedEvent(this.addressValue, this.pinCodeValue);
}


class ChangedAddressEvent extends QInfoEvent {
  final String addressValue;

  ChangedAddressEvent(this.addressValue);
}

class ChangedpinEvent extends QInfoEvent {
  final String pinCodeValue;

  ChangedpinEvent(this.pinCodeValue);
}
