part of 'gsearch_bloc.dart';

abstract class GsearchEvent extends Equatable {
  const GsearchEvent();

  @override
  List<Object> get props => [];
}

class GsearchedEvent extends GsearchEvent {
  String searchedValue;

  GsearchedEvent(this.searchedValue);
}
