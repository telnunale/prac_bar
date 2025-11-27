import 'package:flutter/material.dart';
import 'package:prac_bar/model/producto.dart';
import 'package:prac_bar/viewmodels/pedidos_viewmodel.dart';

class SeleccionarProductos extends StatelessWidget {
  final PedidosViewModel viewModel;
  SeleccionarProductos({super.key, required this.viewModel});

  List<Producto> productos = [
    Producto(id: 1, nombre: 'Coca cola', precio: 2.00),
    Producto(id: 2, nombre: 'Fanta', precio: 2.40),
    Producto(id: 3, nombre: 'Agua', precio: 1.00),
    Producto(id: 4, nombre: 'Nestea', precio: 3.00),
    Producto(id: 5, nombre: 'Café', precio: 1.30),
    Producto(id: 6, nombre: 'Fuzetea', precio: 1.50),
    Producto(id: 7, nombre: 'Bravas', precio: 3.40),
    Producto(id: 8, nombre: 'Alioli', precio: 3.50),
  ];  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Escoge un producto")),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final isSelected = viewModel.productoEstaSeleccionado(productos[index].id);

          return ListTile(
            title: Text(productos[index].nombre),
            subtitle: Text("${productos[index].precio}"),
             trailing: isSelected
                ? Icon(Icons.check_circle, color: Colors.green)
                : null,
            onTap: () {
              viewModel.agregarProductoSeleccionado(productos[index]);
            },
          );
        },
      ),
    );
  }
}
