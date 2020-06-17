import 'package:blockstatemgfltblocpackage/color_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
        builder: (context) => ColorBloc(),
        child: Mainpage()),
      );
    }
}

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(backgroundColor: Colors.black,
            onPressed: (){
            bloc.dispatch(ColorEvent.to_black);
            },),
          SizedBox(width: 10,),
          FloatingActionButton(backgroundColor: Colors.red,
          onPressed: (){
            bloc.dispatch(ColorEvent.to_red);
          },)
        ],
      ),
      appBar: AppBar(title: Text("Bloc dgn flutter_bloc"),),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
          width: 100,
          height: 100,
          color: currentColor,
          duration: Duration(milliseconds: 500),
        ),
      ),
      ),
    );
  }
}
