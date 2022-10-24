import 'package:card_app_v01/bloc/cards/card_bloc.dart';
import 'package:card_app_v01/bloc/cards/card_event.dart';
import 'package:card_app_v01/bloc/cards/card_state.dart';
import 'package:card_app_v01/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardBloc>(
      create: (BuildContext context)=>CardBloc()..add(CardFetchList()),
      child: MaterialApp(
        routes: {'/home':(context)=>const HomePage() },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
      ),
    );
  }
}


