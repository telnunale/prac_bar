import 'package:flutter/material.dart';
import 'package:prac_bar/views/home_screen.dart';
import 'package:prac_bar/viewmodels/pedidos_viewmodel.dart';

void main() {
  final viewModel=PedidosViewModel();
  runApp(MyApp(viewModel: viewModel));
}

class MyApp extends StatelessWidget {
  final PedidosViewModel viewModel;
  const MyApp({super.key,required this.viewModel});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'prac_bar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomeScreen(viewModel: viewModel),
    );
  }
}
