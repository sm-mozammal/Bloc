
import 'package:bloc_practice/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Image Picker Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocProvider(
              create: (context) => InternetBloc(),
              child: const MyHomePage()),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Practice'),
      ),
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if(state is InternetGainedState){
            return const Center(
              child:  Text('Connected'),
            );
          }else if(state is InternetLostState){
            return const Center(
              child:  Text('Not connected'),
            );
          }else {
            return const Center(
              child:  Text('Loadding'),
            );
          }

        }
      )
    );
  }
}
