import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/transformers.dart';

part 'gsearch_event.dart';
part 'gsearch_state.dart';

// Timer? _debounce;

class GsearchBloc extends Bloc<GsearchEvent, GsearchState> {
  late bool isLoaded;
  String data = '';

  GsearchBloc() : super(GsearchState()) {
    on<GsearchedEvent>(
      _onGSearchEvent,
      transformer: (events, mapper) =>
          events.debounceTime(const Duration(seconds: 1)).switchMap(mapper),
    );
  }

  _onGSearchEvent(GsearchedEvent event, Emitter<GsearchState> emitter) {
    // if (_debounce?.isActive ?? false) _debounce!.cancel();
    // _debounce = Timer(const Duration(milliseconds: 500), () {
    try {
      if (event.searchedValue != '') {
        data = event.searchedValue;
        isLoaded = true;
      } else {
        data = '';
        isLoaded = false;
      }
    } on Exception catch (e) {
      isLoaded = false;
    }

    emit(state.copyWith(isLoaded: isLoaded, searchValue: data));
    // });
  }
}
