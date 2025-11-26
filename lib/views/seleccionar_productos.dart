import 'package:flutter/material.dart';
import 'package:prac_bar/model/producto.dart';
import 'package:prac_bar/viewmodels/pedidos_viewmodel.dart';

class SeleccionarProductos extends StatelessWidget{

  final PedidosViewModel viewModel;
  SeleccionarProductos({super.key,required this.viewModel});
  
List<Producto> productos = [
  Producto( nombre: 'Coca cola',  precio: 2.00 ),
  Producto( nombre: 'Fanta',  precio: 2.40 ),
  Producto( nombre: 'Agua',  precio: 1.00 ),
  Producto( nombre: 'Nestea',  precio: 3.00 ),
  Producto( nombre: 'Café',  precio: 1.30  ),
  Producto( nombre: 'Fuzetea',  precio: 1.50  ),
  Producto( nombre: 'Bravas',  precio: 3.40  ),
  Producto( nombre: 'Alioli',  precio: 3.50  ),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escoge un producto"),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context,index){        
          return ListTile(
            title: Text(productos[index].nombre),
            subtitle: Text("${productos[index].precio}"),
          );
        }
        ),
    ) ;
  }





}