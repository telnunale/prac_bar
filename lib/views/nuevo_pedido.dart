import 'package:flutter/material.dart';

class NuevoPedido extends StatelessWidget {
  const NuevoPedido({super.key});


  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(10),
         child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "Mesa de pedido",
                ),
              )
            ],
         )),
    );
  }
}
