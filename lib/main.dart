import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
          
        )),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integers',
            style: GoogleFonts.signika(
                color: Colors.white, fontWeight: FontWeight.w500,fontSize: 25)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              
              return Text(
               
                '${state.count }',
                style: GoogleFonts.signika(fontSize: 150,color: Colors.black38),);
            },
          ),
          
          Text(
            'Integers include zero and all positive and negative numbers.',
            style: GoogleFonts.signika(
          
                color: Colors.grey, fontWeight: FontWeight.w700,fontSize: 25),
          textAlign: TextAlign.center,
          ),
          
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(Icons.add),
              onPressed: () {
                context.read<CounterBloc>().add(Increment());
              },
            ),
            FloatingActionButton(
                backgroundColor: Colors.green,
              child: Icon(Icons.remove),
              onPressed: () {
                context.read<CounterBloc>().add(Decrement());
              },
            ),
            FloatingActionButton(
                backgroundColor: Colors.green,
              child: Icon(Icons.restore),
              onPressed: () {
                context.read<CounterBloc>().add(Reset());
              },
            ),
          ]),
        ],
      ),
    );
  }
}
