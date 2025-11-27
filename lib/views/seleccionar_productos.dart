import 'package:flutter/material.dart';
import 'package:prac_bar/model/producto.dart';
import 'package:prac_bar/viewmodels/pedidos_viewmodel.dart';

class SeleccionarProductos extends StatefulWidget {
  final PedidosViewModel viewModel;
  SeleccionarProductos({super.key, required this.viewModel});

  @override
  State<SeleccionarProductos> createState() => _SeleccionarProductos();
}

class _SeleccionarProductos extends State<SeleccionarProductos> {
  //final PedidosViewModel viewModel;
  //_SeleccionarProductos({ required this.viewModel});

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final isSelected = widget.viewModel.productoEstaSeleccionado(
                  productos[index].id,
                );
                return ListTile(
                  title: Text(productos[index].nombre),
                  subtitle: Text("${productos[index].precio}"),
                  trailing: isSelected
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  onTap: () {
                    setState(() {
                      widget.viewModel.agregarProductoSeleccionado(
                        productos[index],
                      );
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                widget.viewModel.resetProductosSeleccionados();
                Navigator.pop(context, null);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(
                context,
                widget.viewModel.productosSeleccionados,
              ),
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
