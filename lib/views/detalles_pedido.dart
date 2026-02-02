import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prac_bar/model/pedido.dart';


/// Pantalla que muestra el desglose de un pedido.
/// Recibe el objeto [Pedido] a través de los argumentos de la ruta.
/// Muestra la lista de productos y el total del pedido.
class DetallesPedido extends StatelessWidget {
  Pedido pedido = new Pedido(1, []);
  DetallesPedido({super.key, required this.pedido});
  static const routeName = '/detalles_pedido';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Pedidos")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Nº mesa: ${pedido.nMesa}"),            
            Expanded(
              child: ListView.builder(
                itemCount: pedido.productos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(pedido.productos[index].nombre),
                    subtitle: Text(
                      "${pedido.productos[index].precio.toStringAsFixed(2)} €",
                    ),
                  );
                },
              ),
            ),           
            Text("Total: ${pedido.precioTotal().toStringAsFixed(2)}€"),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Volver atrás"),
            ),
          ],
        ),
      ),
    );
  }
}
