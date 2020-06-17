import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum ColorEvent {to_black, to_red}

class ColorBloc extends Bloc<ColorEvent, Color>{
  Color _color = Colors.black;

  @override
  Color get initialState => Colors.black;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.to_black) ? Colors.black : Colors.red;
    yield _color;
  }
}