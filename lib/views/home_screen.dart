import 'package:flutter/material.dart';
import 'package:prac_bar/views/nuevo_pedido.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Pedidos"),
      ),
      body: const Center(
        child:  Text("lp"),
      ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
                final r = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NuevoPedido()
                  ),
                );
               
            }
          ),
           
    );
  }
}
