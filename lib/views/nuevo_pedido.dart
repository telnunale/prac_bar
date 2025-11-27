import 'package:flutter/material.dart';
import 'package:prac_bar/model/producto.dart';
import 'package:prac_bar/viewmodels/pedidos_viewmodel.dart';
import 'package:prac_bar/views/seleccionar_productos.dart';

class NuevoPedido extends StatefulWidget {
  final PedidosViewModel viewModel;
  const NuevoPedido({super.key, required this.viewModel});

  @override
  State<NuevoPedido> createState() => _NuevoPedido();
}

class _NuevoPedido extends State<NuevoPedido> {
  List<Producto> productos = [];
  final TextEditingController mesa = TextEditingController();
  //final PedidosViewModel viewModel;
  //NuevoPedido({super.key, required this.viewModel});
  //const NuevoPedido({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: mesa,
              decoration: const InputDecoration(labelText: "Mesa de pedido"),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () async {
                final r = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SeleccionarProductos(viewModel: PedidosViewModel()),
                  ),
                );
                if (!mounted) return;
                setState(() {
                  if (r != null) {
                    productos = r;
                  }
                });
              },
              child: Text('Seleccionar Productos'),
            ),
            const SizedBox(height: 10),
            if (productos.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: productos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(productos[index].nombre),
                      subtitle: Text("${productos[index].precio} €"),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                widget.viewModel.resetPedidos();
                Navigator.pop(context, null);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                widget.viewModel.agregarPedido(productos, mesa);
                Navigator.pop(context, widget.viewModel.pedidos);
              },
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
