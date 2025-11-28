import 'package:flutter/material.dart';
import 'package:prac_bar/model/pedido.dart';
import 'package:prac_bar/model/producto.dart';
import 'package:prac_bar/viewmodels/pedidos_viewmodel.dart';
import 'package:prac_bar/views/nuevo_pedido.dart';

class HomeScreen extends StatefulWidget {
  final PedidosViewModel viewModel;
  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  Pedido pedido = new Pedido(1, []);
  @override
  void initState() {
    //Es un método que se ejecuta una sola vez, justo cuando el widget es creado por primera vez.
    super.initState();
    widget.viewModel.cargaInicialPedidos();
    //List<Pedido> pedidos = widget.viewModel.pedidos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Pedidos")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            if (widget.viewModel.pedidos.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: widget.viewModel.pedidos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "Numero de mesa ${widget.viewModel.pedidos[index].nMesa}",
                      ),
                      subtitle: Text(
                        "Numero total prodructos: ${widget.viewModel.pedidos[index].productosTotales} - Precio: ${widget.viewModel.pedidos[index].precioTotal().toStringAsFixed(2)} €",
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final r = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NuevoPedido(viewModel: widget.viewModel),
            ),
          );
          if (!mounted) return;
          setState(() {
            if (r != null) {
              pedido = r;
              widget.viewModel.agregarPedido(pedido.productos, pedido.nMesa);
            }
          });
        },
        child: Text("Nuevo Pedido"),
      ),
    );
  }
}
