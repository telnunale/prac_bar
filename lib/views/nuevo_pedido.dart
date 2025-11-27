import 'package:flutter/material.dart';
import 'package:prac_bar/viewmodels/pedidos_viewmodel.dart';
import 'package:prac_bar/views/seleccionar_productos.dart';

class NuevoPedido extends StatelessWidget {
  final PedidosViewModel viewModel;
  NuevoPedido({super.key, required this.viewModel});
  //const NuevoPedido({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Mesa de pedido"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SeleccionarProductos(viewModel: viewModel),
                  ),
                );
              },
              child: Text('Seleccionar Productos'),
            ),
          ],
        ),
      ),
    );
  }
}
